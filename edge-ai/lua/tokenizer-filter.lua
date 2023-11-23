local arr = {}
local tokenLen = 1024

-- console.log(Object.entries(map).map(([k,v]) => `map["${k}"] = ${v}\n`).join("")) 
local map = {}
map["0"] = 22
map["1"] = 29
map["2"] = 28
map["3"] = 33
map["4"] = 23
map["5"] = 47
map["6"] = 44
map["7"] = 45
map["8"] = 46
map["9"] = 54
map["\""] = 1
map["e"] = 2
map["t"] = 3
map[":"] = 4
map["a"] = 5
map["s"] = 6
map["o"] = 7
map["u"] = 8
map["r"] = 9
map[","] = 10
map["d"] = 11
map["l"] = 12
map["p"] = 13
map["h"] = 14
map["y"] = 15
map["q"] = 16
map["c"] = 17
map["{"] = 18
map["}"] = 19
map["m"] = 20
map["n"] = 21
map["i"] = 24
map["/"] = 25
map["g"] = 26
map[" "] = 27
map["&"] = 30
map[";"] = 31
map["w"] = 32
map["="] = 34
map["'"] = 35
map["k"] = 36
map["\\"] = 37
map["<"] = 38
map[">"] = 39
map["b"] = 40
map["f"] = 41
map["v"] = 42
map["-"] = 43
map["j"] = 48
map["z"] = 49
map["_"] = 50
map["!"] = 51
map["("] = 52
map["."] = 53
map["x"] = 55
map["#"] = 56
map[")"] = 57
map["*"] = 58
map["?"] = 59
map["["] = 60
map["]"] = 61
map["+"] = 62

function tokenize_log_event(tag, timestamp, record)

    new_record = record
    new_record["lstm_tokenize"] = {}
    -- logkey log
    for i = 1, tokenLen - string.len(record["log"]) do
        table.insert(new_record["lstm_tokenize"], 0)
    end

    for i = 1, math.min(string.len(record["log"]), tokenLen) do
        local c = record["log"]:sub(i,i)
        -- do something with c
        table.insert(new_record["lstm_tokenize"], map[c])
    end

    for i = #(new_record["lstm_tokenize"])+1, tokenLen do
        table.insert(new_record["lstm_tokenize"], 0)
    end

    return 1, timestamp, record
end