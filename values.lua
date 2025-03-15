local fileName = "BeamingUtil/MM2/Values.lua"
local HTTP = game:GetService("HttpService")
local function fileExists()
    return isfile(fileName)
end
    local values
    if not fileExists() then
        local function GetSupremeValues()
            print("parsing")

            if not getgenv().htmlparser then
                getgenv().htmlparser = loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/RBXL-HTML-Parser/refs/heads/master/html/init.lua"))()
                warn('loaded parser')
            end
        
            if not getgenv().SupremeAncients then
                getgenv().SupremeAncients = game:HttpGet("https://supremevaluelist.com/mm2/ancients.html")
                warn('loaded ancients')
            end
        
            if not getgenv().SupremeChromas then
                getgenv().SupremeChromas = game:HttpGet("https://supremevaluelist.com/mm2/chromas.html"):split('<div class="tierheading" id="pets">Pets</div>')[1]
                warn('loaded chromas')
            end
        
            if not getgenv().SupremeGodlies then
                getgenv().SupremeGodlies = game:HttpGet("https://supremevaluelist.com/mm2/godlies.html")
                warn('loaded godlies')
            end
        
            if not getgenv().SupremeUniques then
                getgenv().SupremeUniques = game:HttpGet("https://supremevaluelist.com/mm2/uniques.html"):split('<div class="tierheading" id="special">Special Tier</div>')[1]
                warn('loaded uniques')
            end
        
            if not getgenv().SupremeVintages then
                getgenv().SupremeVintages = game:HttpGet("https://supremevaluelist.com/mm2/vintages.html")
                warn('got vintages')
            end
            if not getgenv().SupremeLegendarys then
                getgenv().SupremeLegendarys = game:HttpGet("https://supremevaluelist.com/mm2/legendaries.html"):split('<div class="tierheading" id="tier2">Tier 2</div>')[1]
                warn('got legendarys')
            end
        
            local htmlContent = SupremeAncients .. SupremeChromas .. SupremeGodlies .. SupremeUniques .. SupremeLegendarys .. SupremeVintages
        
            local root = htmlparser.parse(htmlContent)
        
            local items = {}
            local itemHeads = root:select(".itemhead")
            local itemBodies = root:select(".itembody")
        
            for i = 1, math.min(#itemHeads, #itemBodies) do
                local itemData = {}
                local name = itemHeads[i]:content():gsub("%s<img.+$", "")
                if string.find(name, "https://www.youtube.com/jdrbx") then
                    name = 'JD'
                end
                itemData.name = name
                local valueElement = itemBodies[i]:select(".itemvalue")
                if #valueElement > 0 then
                    Value = valueElement[1]:content():gsub(",", "")
                    itemData.value = Value
                end
        
                local stabilityElement = itemBodies[i]:select(".itemstability")
                if #stabilityElement > 0 then
                    itemData.stability = stabilityElement[1]:content()
                end
        
                local demandMatch = itemBodies[i]:content():match("Demand %- <b>(%d+)</b>")
                if demandMatch then
                    itemData.demand = tonumber(demandMatch)
                end
        
                local rarityMatch = itemBodies[i]:content():match("Rarity %- <b>(%d+)</b>")
                if rarityMatch then
                    itemData.rarity = tonumber(rarityMatch)
                end
                if not string.find(itemData.name, "Nik's Scythe") then
                    table.insert(items, itemData)
                end
            end
        
            Values = {}
        
            for i,v in items do
                Values[v.name] = {value = tonumber(v.value), rarity = v.rarity, demand = v.demand, stability = v.stability}
            end
            table.sort(Values, function(a,b)
                return a.value > b.value
            end)
        
            Database = require(game.ReplicatedStorage.Database.Sync.Item)
            NewDb = {}
            for i,v in Database do
                if v.Rarity == 'Unique' or v.Rarity == "Godly" or v.Rarity == "Ancient" or v.Rarity == "Classic" or v.Rarity == "Legendary" then
                    table.insert(NewDb, {
                        name = i,
                        rarity = v.Rarity,
                        chroma = v.Chroma or false
                    })
                end
            end
        
            NewNewDb = {}
            for i,v in NewDb do
                if v.name == nil then
                    v.name = '???'
                end
                NewNewDb[v.name] = {rarity = v.rarity, chroma = v.chroma}
            end
        
            NewValues = {}
        
            CorrectNames = {
                ["Red Luger"] = "RedLuger",
                ["Hallow's Blade"] = "HallowsBlade",
                ["Flowerwood Gun"] = "FlowerwoodGun",
                ["Battleaxe II"] = "BattleAxe2",
                ["Rainbow Gun"] = "Rainbow_G",
                ["Waves"] = "Waves_K",
                ["Orange Seer"] = "OrangeSeer",
                ["Icecracker"] = "Icecracker_K_2020",
                ["Soul"] = "WraithGun",
                ["Arctic (Gun)"] = "Arctic_G_2022",
                ["C. Elderwood Blade"] = "ElderwoodKnifeChroma",
                ["Chroma Heat"] = "HeatChroma",
                ["Santa's Spirit"] = "SantasSpirit",
                ["Spirit"] = "WraithKnife",
                ["Vampire's Edge"] = "VampiresEdge",
                ["Vampire's Axe"] = "VampireAxe",
                ["Evergun"] = "TreeGun2023",
                ["Eternal III"] = "Eternal3",
                ["Cotton Candy"] = "CottonCandy",
                ["Chroma Gingerblade"] = "GingerbladeChroma",
                ["Elderwood Revolver"] = "ElderwoodGun",
                ["Chroma Tides"] = "TidesChroma",
                ["Spectral (Knife)"] = "Spectral_K_2021",
                ["Latte (Gun)"] = "Latte_G_2023",
                ["Ginger (Gun)"] = "Ginger_G_2018",
                ["Elderwood Blade"] = "ElderwoodKnife",
                ["Chroma Seer"] = "SeerChroma",
                ["Red Seer"] = "RedSeer",
                ["Ocean"] = "Ocean_G",
                ["Chroma Evergreen"] = "TreeKnife2023Chroma",
                ["Chroma Evergun"] = "TreeGun2023Chroma",
                ["Chroma Bauble"] = "BaubleChroma",
                ["Green Luger"] = "GreenLuger",
                ["Gingermint"] = "Gingermint_G",
                ["Phantom"] = "Phantom2022",
                ["Chroma Boneblade"] = "BonebladeChroma",
                ["Blue Seer"] = "BlueSeer",
                ["Winter's Edge"] = "WintersEdge",
                ["Chroma Lightbringer"] = "ChromaLightbringer",
                ["Cavern (Gun)"] = "Cavern_G_2019",
                ["Tree (Knife)"] = "Tree",
                ["Tree (Gun)"] = "TreeGun",
                ["Rupture"] = "Bleed",
                ["Evergreen"] = "TreeKnife2023",
                ["Ghost (Gun)"] = "GhostG2018",
                ["Red Fire"] = "RedFire",
                ["Blue Scratch"] = "ScratchBlue",
                ["Broken"] = "Broken_K_2023",
                ["Chroma Deathshard"] = "DeathshardChroma",
                ["Red Scratch"] = "Scratch",
                ["Blue Elite"] = "EliteBlue",
                ["Vampire (Knife)"] = "Vampire_K_2022",
                ["Traveler (Gun)"] = "Traveler_G_2023",
                ["Eternal II"] = "Eternal2",
                ["C. Vampire's Gun"] = "VampireGunChroma",
                ["Vampire (Gun)"] = "VampireGun",
                ["Ice Dragon"] = "IceDragon",
                ["Icedriller"] = "Icedriller_G_2020",
                ["Green Elite"] = "EliteGreen",
                ["Swirly Gun"] = "SwirlyGun",
                ["Cavern (Knife)"] = "Cavern_K_2019",
                ["Turkey"] = "Turkey2023",
                ["C. Traveler's Gun"] = "TravelerGunChroma",
                ["Santa's Magic"] = "SantasMagic",
                ["Sakura"] = "Sakura_K",
                ["Chroma Saw"] = "SawChroma",
                ["Traveler's Gun"] = "TravelerGun",
                ["Latte (Knife)"] = "Latte_K_2023",
                ["Australis"] = "AuroraKnife",
                ["Chroma Swirly Gun"] = "SwirlyGunChroma",
                ["Chroma Gemstone"] = "GemstoneChroma",
                ["Corrupt"] = "Sorry",
                ["Old Glory"] = "AmericaSword",
                ["Chroma Fang"] = "FangChroma",
                ["Pearl"] = "Pearl_K",
                ["Ginger Luger"] = "GingerLuger",
                ["Eternal IV"] = "Eternal4",
                ["Ghost (Knife)"] = "GhostK2018",
                ["Chroma Darkbringer"] = "ChromaDarkbringer",
                ["Traveler's Axe"] = "TravelerAxe",
                ["Chroma Luger"] = "LugerChroma",
                ["Ice Shard"] = "IceShard",
                ["Battleaxe"] = "BattleAxe",
                ["Borealis"] = "AuroraGun",
                ["Flowerwood"] = "FlowerwoodKnife",
                ["Cookiecane"] = "Gingermint_K",
                ["Hallow's Edge"] = "Hallow",
                ["Aurora (Gun)"] = "Aurora_G_2021",
                ["Frostfade (Knife)"] = "Frostfade_K_2023",
                ["Batwing"] = "Scythe",
                ["Blossom"] = "Blossom_G",
                ["Chroma Shark"] = "SharkChroma",
                ["Chroma Candleflame"] = "CandleflameChroma",
                ["Yellow Seer"] = "YellowSeer",
                ["Bat"] = "ZombieBat",
                ["C. Constellation"] = "ConstellationChroma",
                ["Purple Seer"] = "PurpleSeer",
                ["Chroma Slasher"] = "SlasherChroma",
                ["Beach"] = "Beach_K_2023",
                ["Elderwood Scythe"] = "ElderwoodScythe",
                ["Eternalcane"] = "EternalCane",
                ["Chroma Laser"] = "LaserChroma",
                ["Pearlshine"] = "Pearl_G",
                ["Chroma Cookiecane"] = "Gingermint_KChroma",
                ["Swirly Blade"] = "SwirlyBlade",
                ["Spectre"] = "Spectre2022",
                ["Vampire's Gun"] = "VampireGun",
                ["Rainbow"] = "Rainbow_K",
                ["Chroma Watergun"] = "WatergunChroma",
                ['Swirly Axe'] = 'SwirlyAxe',
                ['Splitter'] = 'Knife1',
                ['Ghost'] = 'GhostKnife',
                ['Blood'] = 'BloodKnife',
                ['Shadow'] = 'ShadowKnife',
            }
            
        
            tbl = {}
        
            for i,v in Values do
                if not NewNewDb[i] then
                    if NewNewDb[CorrectNames[i]] then
                        NewValues[CorrectNames[i]] = v           
                    end
                end
                if NewNewDb[i] then
                    NewValues[i] = v
                end
            end
        
            return NewValues
        end
                
        writefile(fileName, HTTP:JSONEncode(GetSupremeValues()))
        values = HTTP:JSONDecode(readfile(fileName))
        print("successfully grabbed values")
    else
        values = HTTP:JSONDecode(readfile(fileName))
        print("Value list already exists, skipping value grab process.")
    end
    return values
