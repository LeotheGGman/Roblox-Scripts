local getupvalue = (getupvalue or debug.getupvalue);
local getmetatable = (debug.getmetatable or getrawmetatable);
local hookmetamethod = hookmetamethod or function(tbl, mt, func) return hookfunction(getrawmetatable(tbl)[mt], func) end;

repeat wait() until game:IsLoaded();
 --> LeotheGGman? I am lost.
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LeotheGGman/Roblox-Scripts/main/Parkour/IGNORE%20THIS/TabUI.lua"))();
local players = game:GetService("Players");
local replicatedStorage = game:GetService("ReplicatedStorage");
local scriptContext = game:GetService("ScriptContext");
local client = players.LocalPlayer;
local variables, mainEnv, encrypt;

do
    local banRemotes = {
        "AttemptTeleport";
        "FireToDieInstantly";
        "LandWithForceField";
        "LoadString";
        "FlyRequest";
        "FinishTimeTrial";
        "Under3Seconds";
        "UpdateDunceList";
        "HighCombo";
        "r";
        "t";
        "FF";
    };
--> From Leo: It took me 5 years to play Parkour. It was such a nice time doing that! Bans, appeals, levels, updates... Years went through. 
--> And whats now? Well, I left game. I tried playing modded parkour, but... owners were sucks. I also tried to create my own parkour modded
--> Now i got older, and got other things to do. But im also waiting for Parkour Reborn. And will play that game a lot, at least i hope so ;D
--> Also look for other scripts that i have for parkour. Like bag ESP, its been undetected for 5 years, i think its safe to use it! :)
--> Time went... So fast?
--> And the last thing i want to say: Have fun using my scripts! Also feel free to contact me on discord: leotheggman
--> Have a nice day... or night. I hope that you will succeed in your life and will send me couple bucks for that fun that my scripts gave you! ;D
--> See you on the other side, my dear friend!
    local nc;
    nc = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = {...};
        local method = getnamecallmethod();
    
        if (method == "FireServer" and table.find(banRemotes, self.Name)) then
            return;
        elseif (method == "FireServer" and self.Name == "SubmitCombo" and args[1] > 299) then
            args[1] = math.random(250, 299);
        elseif (method == "TakeDamage" and self.ClassName == "Humanoid" and library.flags.god_mode) then
            return;
        end;
    
        return nc(self, unpack(args));
    end));

    local idx;
    idx = hookmetamethod(game, "__index", newcclosure(function(self, key)
        if (key == "PlaybackLoudness" and getfenv(2).script.Name == "RadioScript" and library.flags.audio_bypass) then
            return 0;
        end;

        return idx(self, key);
    end));

    local function onCharacterAdded(char)
        if (not char) then return end;
        wait(1);
        local mainScript = client.Backpack:WaitForChild("Main");
        variables = getupvalue(getsenv(mainScript).charJump, 1);
        variables.adminLevel = 13;
        getfenv().script = mainScript;
        mainEnv = getsenv(mainScript);
        encrypt = function(str)
            local _, res = pcall(mainEnv.encrypt, str);
            return res;
        end;
    end;

    onCharacterAdded(client.Character);
    client.CharacterAdded:Connect(onCharacterAdded);
end;

local moves = {
    "slide";
    "dropdown";
    "ledgegrab";
    "edgejump";
    "longjump";
    "vault";
    "wallrun";
    "springboard";
};
local parkour = library:CreateWindow("By LeotheGGman");

parkour:AddToggle({
    text = "No Fall Damage";
    flag = "god_mode";
});

parkour:AddToggle({
    text = "Slide Speed";
    flag = "slide_speed_enabled";
    callback = function(enabled)
        if (not enabled) then return end;

        while library.flags.slide_speed_enabled do
            variables.slidespeed = (library.flags.slide_speed or 0);
            wait();
        end;
    end;
});

parkour:AddSlider({
    text = "Slide Speed";
    flag = "slide_speed";
    min = 0;
    max = 300;
});

parkour:AddToggle({
    text = "Halloween";
    flag = "halloween";
    callback = function(enabled)
        replicatedStorage.IsHalloween.Value = enabled;
    end;
});

parkour:AddToggle({
    text = "Maxed Combo";
    flag = "maxed_combo";
    callback = function(enabled)
        if (not enabled) then
            return mainEnv.breakCombo();
        end;

        replicatedStorage.UpdateCombo:FireServer(5);

        while library.flags.maxed_combo do
            variables.comboTime = math.huge
            variables.comboHealth = math.huge;
            variables.comboXp = math.huge;
            variables.comboLevel = 5;
            wait();
        end;
    end;
});

parkour:AddToggle({
    text = "Always Flow";
    flag = "always_flow";
    callback = function(enabled)
        if (not enabled) then return end;

        while library.flags.always_flow do
            variables.flowActive = true;
            variables.flowDelta = 100;
            wait();
        end;
    end;
});

parkour:AddToggle({
    text = "Audio Bypass";
    flag = "audio_bypass";
})

parkour:AddToggle({
    text = "Auto Farm";
    flag = "auto_farm";
    callback = function(enabled)
        if (not enabled) then return end;

        while library.flags.auto_farm do
            if (client.Backpack and client.Backpack:FindFirstChild("Main") and client.PlayerScripts:FindFirstChild("Points") and getsenv(client.Backpack.Main)) then
                local pointsEnv = getsenv(client.PlayerScripts.Points);
                pointsEnv.changeParkourRemoteParent(workspace);

                local scoreRemote = getupvalue(pointsEnv.changeParkourRemoteParent, 2);

                scoreRemote:FireServer(encrypt("walljump"), {
                    [encrypt("walljumpDelta")] = encrypt(tostring(math.random(2.02, 3.55)));
                    [encrypt("combo")] = encrypt(tostring(math.random(4, 5)));
                });

                wait(0.4);

                scoreRemote:FireServer(encrypt(moves[math.random(1, #moves)]), {
                    [encrypt("combo")] = encrypt(tostring(1));
                });

                wait(math.random(1.25, 1.35));
            end;
            wait();
        end;
    end;
});

parkour:AddToggle({
    text = "No Cola Cooldown";
    flag = "fast_cola";
    callback = function(enabled)
        if (not enabled) then return end;

        while library.flags.fast_cola do
            variables.drinkingCola = false;
            wait();
        end;
    end;
});

parkour:AddToggle({
    text = "Ear Rape";
    flag = "ear_rape";
    callback = function(enabled)
        if (not enabled) then return end;

        while library.flags.ear_rape do
            replicatedStorage.PlayCharacterSound:FireServer("DoorBust");
            wait();
        end;
    end;
});

library:Init();
--> We are making Parkour history. WE ARE PARKOUR!
--> The end.
