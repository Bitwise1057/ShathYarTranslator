ShathYarDict = {
    words = {
        -- Greetings & Common
        ["hello"] = {"gh’thak", "gh’tha", "gh’ta"}, -- 6,5,4 chars variants
        ["hi"] = {"gha", "gha"}, -- short variant
        ["friend"] = {"shur'qoz", "shurqo", "shur’q"}, -- 8,7,6 chars
        ["ally"] = {"shur", "shuq"}, -- 4 chars
        ["world"] = {"n'zothar", "n’zotha", "n’zoth"}, -- 8,7,6 chars
        ["yes"] = {"vassk", "vask", "vas"}, -- 5,4,3 chars
        ["no"] = {"ur'qel", "ur’qel", "ur’el"}, -- 6,6,5 chars
        ["you"] = {"ka'zon", "thi", "ka'z", "tha"}, -- 6,3,4,3 chars variants
        ["your"] = {"thi", "ka'z", "tha"}, -- similar to "you"

        -- Pronouns & Verbs
        ["i"] = {"mi"},
        ["am"] = {"imai", "im"},
        ["are"] = {"s'lath", "inai", "sla", "nai"},
        ["will"] = {"eiwa", "ewa", "iwa"},
        ["have"] = {"averi", "aver", "ave"},
        ["is"] = {"si", "s'"},
        ["do"] = {"du", "do"},

        -- Emotions & States
        ["fear"] = {"grath", "rilven", "grav", "riven"},
        ["desire"] = {"solka", "sol’ka", "sol", "solk"},
        ["sadness"] = {"nariq", "nari", "naq"},
        ["rage"] = {"teshan", "tesha", "tesh"},
        ["calm"] = {"ulmira", "ulmir", "ulm"},
        ["pride"] = {"zeku", "zek", "ze"},
        ["joy"] = {"k'hun", "khun", "kun"},
        ["love"] = {"karis", "kari"},

        -- Nature & Elements
        ["tree"] = {"vurni", "vurn", "vur"},
        ["cold"] = {"qorra", "qorr", "qor"},
        ["fire"] = {"shagal", "shaga", "shag"},
        ["wind"] = {"duveth", "duveth", "duv"},
        ["water"] = {"ishi", "ish"},
        ["stone"] = {"krenoth", "krenot", "kren"},
        ["moon"] = {"evara", "evar"},
        ["shadow"] = {"zarith", "zari", "zar"},
        ["soul"] = {"mireth", "miret", "mir"},
        ["mind"] = {"ghul", "ghu"},
        ["truth"] = {"yashra", "yash"},
        ["lie"] = {"nazel", "naz"},
        ["memory"] = {"truvel", "truve", "tru"},

        -- Beings & Roles
        ["warrior"] = {"karak", "kara", "kar"},
        ["child"] = {"ollu", "oll"},
        ["guide"] = {"velmor", "velmo", "vel"},
        ["enemy"] = {"drathin", "drathi", "drat"},
        ["leader"] = {"morza", "morz", "mor"},
        ["healer"] = {"essel", "esse", "ess"},
        ["stranger"] = {"tanrik", "tanri", "tan"},
        ["outsider"] = {"tanrik", "tanri", "tan"},

        -- Time & Space
        ["tomorrow"] = {"imur", "imu"},
        ["future"] = {"imur", "imu"},
        ["before"] = {"geth", "get"},
        ["past"] = {"geth", "get"},
        ["dusk"] = {"orvun", "orvu"},
        ["ending"] = {"orvun", "orvu"},
        ["dawn"] = {"sevra", "sevr"},
        ["moment"] = {"tharn", "thar"},
        ["place"] = {"elyth", "elyt"},
        ["realm"] = {"elyth", "elyt"},
        ["far"] = {"zani", "zan"},
        ["distant"] = {"zani", "zan"},

        -- Misc Longer Words (for length matching)
        ["alphanumeric"] = {"shathalinar", "shathalin", "shathal"},
        ["consequence"] = {"zarnithol", "zarnith", "zarni"},
        ["extraordinary"] = {"velmorinthar", "velmorinth", "velmori"},
        ["transcendent"] = {"imirazoth", "imirazo", "imira"},
        ["mystical"] = {"seregath", "serega", "sereg"},
        ["fluffy"] = {"yu'gaz", "yu'gaz", "yu'gaz"},
    },

    lengths = {
        [1] = { "ag", "ak", "ez", "zz", "mh", "uq", "za", "sk" },
        [2] = { "ag", "ak", "ez", "zz", "mh", "uq", "za", "sk", "ma", "qi" },
        [3] = { "erh", "fhn", "gag", "gaz", "hoq", "mah", "maq", "nuq", "oou", "qam", "qor", "qov", "shg", "tek", "uhn", "wah", "zuq" },
        [4] = { "h'iwn", "agth", "aqev", "fash", "fssh", "kyth", "magg", "naus", "okom", "puul", "qwaz", "thoq", "uull", "worg", "yahf", "ywaq", "zaix", "zzof" },
        [5] = { "agthu", "huqth", "ilfah", "ilith", "lwhuk", "plahf", "shath", "shuul", "sythn", "thyzz", "uulwi", "uuyat", "vorzz", "yyqzz" },
        [6] = { "kaaxth", "eqnizz", "halahs", "iggksh", "naggwa", "skshgn", "ssaggh", "thyzak", "uhn'agh", "uhnish", "uovssh", "yeh'glu" },
        [7] = { "agthshi", "gul'kafh", "iiqaath", "vwahuhn" },
        [8] = { "Shath'gral", "Shuul'wah" }
    }
}
