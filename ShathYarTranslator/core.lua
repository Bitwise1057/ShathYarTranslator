local addonEnabled = true
local debugEnabled = false
local recentWordsCache = {}
local maxCacheSize = 50

local function DebugPrint(msg, isError)
    if not debugEnabled then return end
    local prefix = isError and "|cFFFF0000" or "|cFF9932CC"
    print(prefix .. msg .. "|r")
end

-- Build buckets of generic fallback words by length from ShathYarDict.lengths
local lengthBuckets = nil

local function buildLengthBuckets()
    lengthBuckets = {}
    for len, words in pairs(ShathYarDict.lengths) do
        lengthBuckets[len] = lengthBuckets[len] or {}
        for _, w in ipairs(words) do
            table.insert(lengthBuckets[len], w)
        end
    end
    DebugPrint("Built length buckets from dictionary lengths.", false)
end

local function getRandomLengthWord(len)
    if not lengthBuckets then buildLengthBuckets() end

    local candidates = lengthBuckets[len] or {}

    -- Try ±1 length if no perfect match
    if #candidates == 0 and lengthBuckets[len - 1] then
        candidates = lengthBuckets[len - 1]
    end
    if #candidates == 0 and lengthBuckets[len + 1] then
        candidates = lengthBuckets[len + 1]
    end

    -- Absolute fallback to any length bucket words
    if #candidates == 0 then
        candidates = {}
        for _, words in pairs(lengthBuckets) do
            for _, w in ipairs(words) do
                table.insert(candidates, w)
            end
        end
    end

    if #candidates == 0 then return nil end

    -- Avoid recently used words
    local choice
    local attempts = 0
    repeat
        choice = candidates[math.random(#candidates)]
        attempts = attempts + 1
    until not recentWordsCache[choice] or attempts >= 5

    recentWordsCache[choice] = true
    if #recentWordsCache > maxCacheSize then
        recentWordsCache = {}
    end

    return choice
end

-- Get random translation from ShathYarDict.words for a known word
local function getRandomTranslation(word)
    local entry = ShathYarDict.words[word]
    if not entry then return nil end
    if type(entry) == "table" then
        return entry[math.random(#entry)]
    else
        return entry
    end
end

local function splitTextWithPunctuation(text)
    local parts = {}
    local i = 1
    while i <= #text do
        local s, e = text:find("[%a]+", i)
        if s == i then
            table.insert(parts, {type = "word", text = text:sub(s, e)})
            i = e + 1
        else
            local s2, e2 = text:find("[^%a]+", i)
            if s2 == i then
                table.insert(parts, {type = "sep", text = text:sub(s2, e2)})
                i = e2 + 1
            else
                break
            end
        end
    end
    return parts
end

local function preserveCapitalization(original, replacement)
    if original:match("^%u") then
        return replacement:gsub("^%l", string.upper)
    end
    return replacement
end

local function TranslateToShathYar(text)
    if not lengthBuckets then buildLengthBuckets() end

    local parts = splitTextWithPunctuation(text)
    for i, part in ipairs(parts) do
        if part.type == "word" then
            local lowerWord = part.text:lower()
            local replacement = getRandomTranslation(lowerWord)

            if not replacement then
                -- Unknown word: use length-based fallback words
                local fallbackWord = getRandomLengthWord(#lowerWord)
                replacement = fallbackWord or part.text
            end

            replacement = preserveCapitalization(part.text, replacement)
            part.text = replacement
        end
    end

    local result = {}
    for _, part in ipairs(parts) do
        table.insert(result, part.text)
    end

    return table.concat(result)
end

local function SendShathYarMessage(msg, chatType)
    if not addonEnabled then
        SendChatMessage(msg, chatType)
        return
    end

    local translated = "[Shath'yar] " .. TranslateToShathYar(msg)
    SendChatMessage(translated, chatType)

    local targetName = UnitName("target")
    local isPlayer = UnitIsPlayer("target")
    if targetName and isPlayer then
        local prefixedMsg = "[Translated] " .. msg
        SendChatMessage(prefixedMsg, "WHISPER", nil, targetName)
        DebugPrint("Sent translated whisper to " .. targetName .. ": " .. prefixedMsg, false)
    else
        DebugPrint("No valid player target selected for whispering English message.", true)
    end
end

local function makeSlashHandler(chatType)
    return function(msg)
        if msg == "" then
            print("|cFF9932CCUsage: /shsay <message>|r")
            return
        end
        SendShathYarMessage(msg, chatType)
    end
end

SLASH_SHSAY1   = "/shsay"   SlashCmdList["SHSAY"]   = makeSlashHandler("SAY")
SLASH_SHYELL1  = "/shyell"  SlashCmdList["SHYELL"]  = makeSlashHandler("YELL")
SLASH_SHPARTY1 = "/shparty" SlashCmdList["SHPARTY"] = makeSlashHandler("PARTY")
SLASH_SHRAID1  = "/shraid"  SlashCmdList["SHRAID"]  = makeSlashHandler("RAID")
SLASH_SHEMOTE1 = "/shemote" SlashCmdList["SHEMOTE"] = makeSlashHandler("EMOTE")
