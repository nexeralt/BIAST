local ScriptLaunched, ScriptError = pcall(function()
    

-- WARNING FOR SKIDS: THIS SCRIPT IS A MESSY HELL AND A COPY OF DOD SCRIPT

function CheckIfUserInGroup()
if game:GetService("Players").LocalPlayer:IsInGroup(35649714) then
return true
end
return false
end

function TableFirstElementToString(tbl)
if type(tbl) == "table" then
for _,element in ipairs(tbl) do
return tostring(element)
end
else
return tostring(tbl)
end
end

pcall(function()
Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()
end)

pcall(function()
Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)

function Notify(title, content, time, mode)
time = time or 4
mode = mode or false
if mode == true then
img = 136186846844342
elseif mode == false then
img = 71508738660632
end
Rayfield:Notify({
	Title = title,
	Content = content,
	Duration = time,
	Image = img,
	Actions = {},
})
end

function ErrorRequire()
Notify("Error!", "Your executor doesn't support ''require'' function which is being used in this feature!")
end

function ErrorSignal()
Notify("Error!", "Your executor doesn't support ''firesignal'' function which is being used in this feature!")
end

pcall(function()
WebHandler = loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/CustomFunctions/refs/heads/main/funcs.txt"))()
end)

pcall(function()
game:GetService("CoreGui")
end)

if not game:FindService("CoreGui") then
game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error!",Text = "Your executor don't have access to core gui which is being used for UI library! Script stopped loading.",Icon = "rbxassetid://125704683916878",Duration = 36000,Button1 = "Ok!"})
return nil
end

function TestSignal()
if firesignal then
return true
end
return false
end

function TestRequire()
if require then
return true
end
return false
end

pcall(function()
game = game or workspace.Parent or Ugc or _game or __game
end)
Players = game:GetService("Players")
LP = Players.LocalPlayer

function HaveAtt(att, parent)
local attribute = tostring(att)
if parent:GetAttribute(tostring(attribute)) then
return true
else
return false
end
end

function GetAtt(att, parent)
local attribute = parent:GetAttribute(tostring(att))
return attribute
end

function SetAtt(att, val, parent)
local attribute = tostring(att)
local value = val
parent:SetAttribute(tostring(attribute), value)
end

Window = Rayfield:CreateWindow({
   Name = "Nexer Hub - BIAST",
   Icon = 0,    
   LoadingTitle = "Nexer Hub",
   LoadingSubtitle = "by nexer",
   Theme = "Ocean",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = "BIAST:NH",
      FileName = "BIAST:NH_Configuration"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "WARNING ⚠️",
      Subtitle = "While this script may be the best one, please note that any form of exploiting is always bannable.",
      Note = "If you accept the risk, you can continue. The key is ''nexer1234''",
      FileName = "Key",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {"nexer1234","NEXER1234","Nexer1234"}
   }
})

if TestRequire() ~= true then
Notify("Warning!", "Your executor don't support require function, which is being used in most of the features!", 8, false)
end

--[[if TestSignal() ~= true then
Notify("Warning!", "Your executor don't support firesignal function, which is being used in some of the features!", 8, false)
end]]--

--[[ 


  _________ __                  __               
 /   _____//  |______    _____ |__| ____ _____   
 \_____  \\   __\__  \  /     \|  |/    \\__  \  
 /        \|  |  / __ \|  Y Y  \  |   |  \/ __ \_
/_______  /|__| (____  /__|_|  /__|___|  (____  /
        \/           \/      \/        \/     \/ 

Stamina Management


]]--

--[[pcall(function()
MovementModule = require(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Movement"))
end)]]--

function ReturnStaminaSettings()
if LP and LP.Character and LP.Character:FindFirstChild("Stamina") then
return true, LP.Character:WaitForChild("Stamina")
end
return false, nil
end

local Stamina = Window:CreateTab("Stamina Management",9525535512)
Stamina:CreateSection("Quick Changes (★‿★)")

Stamina:CreateButton({Name = "Infinity Stamina"; Callback = function()
local HaveStamSettings, StamSettings = ReturnStaminaSettings()
if HaveStamSettings then
StamSettings.Value = (math and math.huge) or 9e9
SetAtt("MaxStamina", ((math and math.huge) or 9e9), StamSettings)
Notify("Success!", "Now your stamina is infinite!", 4, true)
return nil
end
Notify("Error!", "Stamina settings not found!")
end; })

Stamina:CreateButton({Name = "2x Speed Modifier"; Callback = function()
local HaveStamSettings, StamSettings = ReturnStaminaSettings()
if HaveStamSettings then
StamSettings.Parent:WaitForChild("Sprint",2):WaitForChild("SpeedMultiplier").Value = 2
Notify("Success!", "Your sprint modifier is now 2x!", 4, true)
return nil
end
Notify("Error!", "Stamina settings not found!")
end; })

Stamina:CreateSection("Quick Toggles (╯▽╰ )")

Stamina:CreateToggle({Name = "Can Jump?"; CurrentValue = false; Callback = function(Value)
CanJump = Value
if CanJump == true then
repeat task.wait() until game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or CanJump == false
game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = 50
Notify("Success!", "You can jump now! Very ''useful'' thing.", 4, true)
elseif CanJump == false then
repeat task.wait() until game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = 0
end
end; })

Stamina:CreateToggle({Name = "No Stamina Loss"; CurrentValue = false; Callback = function(Value)
StaminaLoss = Value
if StaminaLoss == true then
repeat task.wait()
local HaveStamSettings, StamSettings = ReturnStaminaSettings()
if HaveStamSettings then
if HaveAtt("MaxStamina", StamSettings) == true then
StamSettings.Value = GetAtt("MaxStamina", StamSettings)
end
end
until StaminaLoss == false
end
end; })

--[[Stamina:CreateToggle({Name = "No Fatigue"; CurrentValue = false; Callback = function(Value)
if TestRequire() ~= true then
ErrorRequire()
return nil
end
NoFatigue = Value
if NoFatigue == true then
repeat task.wait(0.005)
if HaveAtt("Fatigue") == true then
SetAtt("Fatigue", false)
end
until NoFatigue == false
end
end; })]]--

Stamina:CreateSection("Advanced ◑﹏◐")

Stamina:CreateToggle({Name = "Auto-Fill Stamina After Changing Max Stamina"; CurrentValue = true; Callback = function(Value)
AutoFillStamina = Value
end; })
AutoFillStamina = true

Stamina:CreateInput({Name = "Max Stamina"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
local HaveStamSettings, StamSettings = ReturnStaminaSettings()
if HaveStamSettings then
SetAtt("MaxStamina", tonumber(Value), StamSettings)
if AutoFillStamina == true then
StamSettings.Value = tonumber(Value)
end
return nil
end
Notify("Error!", "Stamina settings not found!")
end; })

Stamina:CreateInput({Name = "Speed Modifier"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
local HaveStamSettings, StamSettings = ReturnStaminaSettings()
if HaveStamSettings then
StamSettings.Parent:WaitForChild("Sprint",2):WaitForChild("SpeedMultiplier").Value = tonumber(Value)
return nil
end
Notify("Error!", "Stamina settings not found!")
end; })

Stamina:CreateSection("Auto-Injection ￣へ￣")

Stamina:CreateToggle({Name = "Auto-Inject"; CurrentValue = false; Callback = function(Value)
AutoInjectStamina = Value
if AutoInjectStamina == true then
Notify("Success!", "Stamina settings will automatically apply to your character at the start of the round!", 7, true)
end
end; })
AutoInjectStamina = false

Stamina:CreateInput({Name = "Max Stamina"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
_G.MaxStaminaInjection = tonumber(Value)
end; })

Stamina:CreateInput({Name = "Stamina Modifier"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
_G.SpeedModifierInjection = tonumber(Value)
end; })

game:GetService("Workspace"):WaitForChild("Characters").DescendantAdded:Connect(function(descendant)
if descendant and descendant.Name == ""..LP.Name.."" and AutoInjectStamina == true then
task.wait(2)
local HaveStamSettings, StamSettings = ReturnStaminaSettings()
pcall(function()
SetAtt("MaxStamina", _G.MaxStaminaInjection, StamSettings)
StamSettings.Value = _G.MaxStaminaInjection
end)
pcall(function()
StamSettings.Parent:WaitForChild("Sprint",2):WaitForChild("SpeedMultiplier").Value = _G.StaminaModifierInjection
end)
end
end)

--[[ 


___________               __                 
\_   _____/ _____   _____/  |_  ____   ______
 |    __)_ /     \ /  _ \   __\/ __ \ /  ___/
 |        \  Y Y  (  <_> )  | \  ___/ \___ \ 
/_______  /__|_|  /\____/|__|  \___  >____  >
        \/      \/                 \/     \/ 

Emotes Management


]]--

function GetChildNames(model)
local coolbalt = {}
for i,v in pairs(model:GetChildren()) do
if v then
table.insert(coolbalt, tostring(v.Name))
end
end
return coolbalt
end

Emotes_Table = GetChildNames(game:GetService("ReplicatedStorage").Modules.EmoteInfos.Emotes)
function GetRandomEmote()
return Emotes_Table[math.random(1, #Emotes_Table)]
end
--[[pcall(function()
EmotesModule = require(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Ability"))
end)]]--
local Dance = Window:CreateTab("Emotes Management",9006890331)
Dance:CreateSection("Dance o(*^▽^*)┛")

local choosen_emote = Emotes_Table[1]
Dance:CreateDropdown({Name = "Choosen Emote"; Options = Emotes_Table; CurrentOption = Emotes_Table[1]; MultiSelection = false; Callback = function(Value)
choosen_emote = TableFirstElementToString(Value)
end; })

Dance:CreateButton({Name = "Override-Use Choosen Emote"; Callback = function()
local args = {
    [1] = true;
    [2] = tostring(choosen_emote);
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ServerEmote"):FireServer(unpack(args))
end; })

Dance:CreateButton({Name = "Override-Stop Using All Emotes"; Callback = function()
local args = {
    [1] = false;
}
for i = 1,99 do
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ServerEmote"):FireServer(unpack(args))
end
end; })



--[[ 


   _____ ___     __ __   __  __   __               
  /  _  \\_ |__ |__|  | |__|/  |_|__| ____   ______
 /  /_\  \| __ \|  |  | |  \   __\  |/ __ \ /  ___/
/    |    \ \_\ \  |  |_|  ||  | |  \  ___/ \___ \ 
\____|__  /___  /__|____/__||__| |__|\___  >____  >
        \/    \/                         \/     \/ 

~~Abilities~~ Items Management


]]--


local Ability = Window:CreateTab("Items Management",0)

Ability:CreateSection("Get Items ~(￣▽￣)~")

function SafeTeleport(model, ofs)
pcall(function()
local time = tick()
while tick() - time < 1 do
for i,v in pairs(LP.Character:GetDescendants()) do
if v and v:IsA("BasePart") then
v.Velocity = Vector3.new(0,0,0)
v.RotVelocity = Vector3.new(0,0,0)
end
end
if ofs then
LP.Character:WaitForChild("HumanoidRootPart").CFrame = model.CFrame * ofs
else
LP.Character:WaitForChild("HumanoidRootPart").CFrame = model.CFrame
end
task.wait()
end
end)
end

function SafeCTeleport(cfr)
pcall(function()
local time = tick()
while tick() - time < 1 do
for i,v in pairs(LP.Character:GetDescendants()) do
if v and v:IsA("BasePart") then
v.Velocity = Vector3.new(0,0,0)
v.RotVelocity = Vector3.new(0,0,0)
end
end
LP.Character:WaitForChild("HumanoidRootPart").CFrame = cfr
task.wait()
end
end)
end

function SafePTeleport(pos)
pcall(function()
local time = tick()
while tick() - time < 1 do
for i,v in pairs(LP.Character:GetDescendants()) do
if v and v:IsA("BasePart") then
v.Velocity = Vector3.new(0,0,0)
v.RotVelocity = Vector3.new(0,0,0)
end
end
LP.Character:WaitForChild("HumanoidRootPart").Position = pos
task.wait()
end
end)
end

function HaveItemEquipped()
local iteminstance = nil
for i,v in pairs(LP.Character:GetChildren()) do
if v and v:IsA("Model") then
iteminstance = v.Parent
end
end
return (iteminstance~=nil), iteminstance
end

function IsTool(t)
if t and t:IsA("Model") and ((t:FindFirstChildOfClass("ProximityPrompt") or t:FindFirstChild("Handle")) or (t:FindFirstChildOfClass("BasePart") and t:FindFirstChildOfClass("BasePart"):FindFirstChildOfClass("ProximityPrompt"))) then
return true
end
return false
end

function GetTools(hmm)
local itemstable = {}
for i,v in pairs(game:GetService("Workspace").Items:GetChildren()) do
if IsTool(v) == true and game.ReplicatedStorage[hmm]:FindFirstChild(v.Name) then
table.insert(itemstable,v.Name)
end
end
return itemstable
end

local AvailableItemsTable = {}
local AvailableArtifactTable = {}
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
if IsTool(v) == true then
if game.ReplicatedStorage.Minor:FindFirstChild(v.Name) then
AvailableItemsTable[v.Name] = v
elseif game.ReplicatedStorage.Major:FindFirstChild(v.Name) then
AvailableArtifactTable[v.Name] = v
end
end
end

function GetTableInfo(what, tbl)
local temptable = {}
if what == "Name" then
for i,v in pairs(tbl) do
table.insert(temptable,i)
end
else
for i,v in pairs(tbl) do
table.insert(temptable,v)
end
end
return temptable
end

local AvailableItemsDropdown = Ability:CreateDropdown({Name = "Items on Map"; Options = GetTools("Minor"); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
ChoosenAvailableItem = TableFirstElementToString(Value)
end; })
local GettingItem = false
Ability:CreateButton({Name = "Get Item"; Callback = function()
if GettingItem == true then
Notify("Error!", "Already getting another item!", 3, false)
return nil
end
if not game:GetService("Workspace"):WaitForChild("Items"):FindFirstChildOfClass("Model") then
Notify("Error!", "There are no items!", 3, false)
return nil
end
if not LP.Character or not LP.Character:FindFirstChild("Head") then
Notify("Error!", "You are either dead or in menu!", 4, false)
return nil
end
if ChoosenAvailableItem == nil or ChoosenAvailableItem == "" or not ChoosenAvailableItem then
Notify("Error!", "Choose your target!", 3, false)
return nil
end
GettingItem = true
local HaveItem, ItemInstance = HaveItemEquipped()
if HaveItem then
local args = {
	ItemInstance.Name,
	"drop"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Item"):FireServer(unpack(args))
task.wait(1.5)
end
local targetitem = workspace.Items:WaitForChild(ChoosenAvailableItem):FindFirstChildWhichIsA("BasePart")
local oldpos = LP.Character:WaitForChild("HumanoidRootPart").CFrame
wait()
SafeTeleport(targetitem, CFrame.new(0,5,0))
local trgtprox = (targetitem:FindFirstChild("ProximityPrompt") and targetitem.ProximityPrompt) or targetitem.Parent:FindFirstChildOfClass("ProximityPrompt")
if fireproximityprompt then
fireproximityprompt(trgtprox)
else
local vim_test = try(Instance.new("VirtualInputManager"))
local temp_vim = (vim_test and Instance.new("VirtualInputManager")) or game:GetService("VirtualInputManager")
trgtprox.Enabled = true
trgtprox.RequiresLineOfSight = false
trgtprox.MaxActivationDistance = tonumber(trgtprox.MaxActivationDistance) + 1
trgtprox.HoldDuration = 0
temp_vim:SendKeyEvent(true, trgtprox.KeyboardKeyCode, false, game)
task.wait()
temp_vim:SendKeyEvent(false, trgtprox.KeyboardKeyCode, false, game)
end
task.wait(.7)
AvailableItemsDropdown:Set({""})
SafeCTeleport(oldpos)
task.wait(1)
GettingItem = false
end; })


Ability:CreateSection("Item Abuse (^q^)")

Ability:CreateButton({Name = "Send someone to void using bodyswap potion"; Callback = function()
if not LP.Character or not LP.Character:FindFirstChild("Head") then
Notify("Error!", "You are either dead or in menu!", 4, false)
return nil
end
local waitig = false
local oldspot = LP.Character:WaitForChild("HumanoidRootPart").CFrame
wait()
task.spawn(function()
repeat task.wait()
for i,v in pairs(LP.Character:GetDescendants()) do
if v and v:IsA("BasePart") then
v.Velocity = Vector3.new(0,0,0)
v.RotVelocity = Vector3.new(0,0,0)
end
end
LP.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(1337,0,1337)
until waitig == true
end)
local args = {
    [1] = "BodySwapPotion";
    [2] = "use";
    [3] = Vector3.new(1337,0,1337);
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("Item", 9e9):FireServer(unpack(args))
task.wait(10)
waitig = true
LP.Character:WaitForChild("HumanoidRootPart").CFrame = oldspot
end; })

Ability:CreateSection("Item Use Spam ╰（‵□′）╯")

Ability:CreateLabel("You need to hold choosen item in hands in order to spam use it!")

preferedabilitytospam = GetChildNames(game:GetService("ReplicatedStorage").Minor)[1]
Ability:CreateDropdown({Name = "Item to Spam Use"; Options = GetChildNames(game:GetService("ReplicatedStorage").Minor); CurrentOption = GetChildNames(game:GetService("ReplicatedStorage").Minor)[1]; MultiSelection = false; Callback = function(Value)
preferedabilitytospam = TableFirstElementToString(Value)
end; })

Ability:CreateToggle({Name = "Auto-Spam Use Item"; CurrentValue = false; Callback = function(Value)
AutoSpamAbility = Value
if AutoSpamAbility == true then
repeat task.wait(0.15)
if LP.Character and LP.Character:FindFirstChild("Head") then
local args
if preferedabilitytospam == "Bomb" or preferedabilitytospam == "Snowball" or preferedabilitytospam == "Superball" or preferedabilitytospam == "banhammer" then
args = {
    [1] = preferedabilitytospam;
    [2] = "throw";
    [3] = LP.Character:WaitForChild("Head").Position;
}
else
args = {
    [1] = preferedabilitytospam;
    [2] = "use";
    [3] = LP.Character:WaitForChild("Head").Position;
}
end
game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("Item", 9e9):FireServer(unpack(args))
end
until AutoSpamAbility == false
end
end; })


Ability:CreateSection("Other things...")

Ability:CreateToggle({Name = "Auto-Spawn Items ( Need Vending Machines on Map )"; CurrentValue = false; Callback = function(Value)
AutoClickVM = Value
if AutoClickVM == true then
repeat task.wait(.5)
if workspace.MapWorkspace:FindFirstChildOfClass("Folder") and workspace.MapWorkspace:FindFirstChildOfClass("Folder"):FindFirstChild("VendingMachines") then
for i,v in pairs(workspace.MapWorkspace:FindFirstChildOfClass("Folder"):FindFirstChild("VendingMachines"):GetDescendants()) do
if v and v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
end
until AutoClickVM == false
end
end; })


--[[ 


   _____ ___     __ __   __  __
   
   .
   
   ARTIFACTS
   
   
   

~~ARTS Management


]]--


local Artifacts = Window:CreateTab("Artifacts Management",0)

Artifacts:CreateSection("Collect & Retrieve 0~0")

Artifacts:CreateLabel("Artifact must be pickable to collect and retrieve! ( not trapped in ice, cage, box or something else )")

local AvailableArtifactDropdown = Artifacts:CreateDropdown({Name = "Artifacts on Map"; Options = GetTools("Major"); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
ChoosenAvailableArtifact = TableFirstElementToString(Value)
end; })
game:GetService("Workspace").Items.ChildAdded:Connect(function(v)
AvailableItemsDropdown:Refresh(GetTools("Minor"))
AvailableArtifactDropdown:Refresh(GetTools("Major"))
end)
game:GetService("Workspace").Items.ChildRemoved:Connect(function(v)
AvailableItemsDropdown:Refresh(GetTools("Minor"))
AvailableArtifactDropdown:Refresh(GetTools("Major"))
end)
Artifacts:CreateButton({Name = "Get & Retrieve Artifact"; Callback = function()
if GettingItem == true then
Notify("Error!", "Already getting another item!", 3, false)
return nil
end
if not game:GetService("Workspace"):WaitForChild("Items"):FindFirstChildOfClass("Model") then
Notify("Error!", "There are no items!", 3, false)
return nil
end
if not LP.Character or not LP.Character:FindFirstChild("Head") then
Notify("Error!", "You are either dead or in menu!", 4, false)
return nil
end
if ChoosenAvailableArtifact == nil or ChoosenAvailableArtifact == "" or not ChoosenAvailableArtifact then
Notify("Error!", "Choose your target!", 3, false)
return nil
end
GettingItem = true
local HaveItem, ItemInstance = HaveItemEquipped()
if HaveItem then
local args = {
	ItemInstance.Name,
	"drop"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Item"):FireServer(unpack(args))
task.wait(1.5)
end
local targetitem = workspace.Items:WaitForChild(ChoosenAvailableArtifact):FindFirstChildWhichIsA("BasePart")
local oldpos = LP.Character:WaitForChild("HumanoidRootPart").CFrame
wait()
SafeTeleport(targetitem, CFrame.new(0,5,0))
local trgtprox = (targetitem:FindFirstChildOfClass("ProximityPrompt") and targetitem.ProximityPrompt) or targetitem.Parent:FindFirstChildOfClass("ProximityPrompt")
if fireproximityprompt then
fireproximityprompt(trgtprox)
else
local vim_test = try(Instance.new("VirtualInputManager"))
local temp_vim = (vim_test and Instance.new("VirtualInputManager")) or game:GetService("VirtualInputManager")
trgtprox.Enabled = true
trgtprox.RequiresLineOfSight = false
trgtprox.MaxActivationDistance = tonumber(trgtprox.MaxActivationDistance) + 1
trgtprox.HoldDuration = 0
temp_vim:SendKeyEvent(true, trgtprox.KeyboardKeyCode, false, game)
task.wait()
temp_vim:SendKeyEvent(false, trgtprox.KeyboardKeyCode, false, game)
end
task.wait(.7)
AvailableArtifactDropdown:Set({""})
if workspace.MapWorkspace:FindFirstChildOfClass("Folder"):FindFirstChild("Zone") then
SafeTeleport(workspace.MapWorkspace:FindFirstChildOfClass("Folder"):FindFirstChild("Zone"))
else
Notify("Warning!", "You didn't retrieve artifact because there's no retrieve zone", 4, false)
SafeCTeleport(oldpos)
end
task.wait(1)
GettingItem = false
end; })

Artifacts:CreateSection("All Artifacts (◜‿◝)♡")

AutoTPtoZone = false
Artifacts:CreateToggle({Name = "Auto-TP to Zone after Picking up any Artifact"; CurrentValue = false; Callback = function(Value)
AutoTPtoZone = Value
end; })

workspace.Characters.Live.DescendantAdded:Connect(function(v)
task.wait(.3)
if AutoTPtoZone == true and IsTool(v) and game.ReplicatedStorage.Major:FindFirstChild(v.Name) and LP.Character:FindFirstChild(v.Name) then
SafeTeleport(workspace.MapWorkspace:FindFirstChildOfClass("Folder"):FindFirstChild("Zone"))
end
end)


Artifacts:CreateSection("Teapot Artifact !-!")

AutoPickUpTeapot = false
Artifacts:CreateToggle({Name = "Auto-Pick Up Teapot"; CurrentValue = false; Callback = function(Value)
AutoPickUpTeapot = Value
end; })

game:GetService("ProximityPromptService").PromptShown:Connect(function(prompt, type)
if AutoPickUpTeapot == true and prompt.Parent.Parent.Name == "Teapot" then
if fireproximityprompt then
fireproximityprompt(prompt)
else
local vim_test = try(Instance.new("VirtualInputManager"))
local temp_vim = (vim_test and Instance.new("VirtualInputManager")) or game:GetService("VirtualInputManager")
prompt.Enabled = true
prompt.RequiresLineOfSight = false
prompt.MaxActivationDistance = tonumber(prompt.MaxActivationDistance) + 1
prompt.HoldDuration = 0
temp_vim:SendKeyEvent(true, prompt.KeyboardKeyCode, false, game)
task.wait()
temp_vim:SendKeyEvent(false, prompt.KeyboardKeyCode, false, game)
end
end
end)

--[[ 


   _____ ___     __ __   __  __
   
   .
   
   MAP THINGS
   
   
   

~~MAP Management


]]--


local KillerThings = Window:CreateTab("Killer Abilities",0)

KillerThings:CreateLabel("FOR YOUR INFORMATION, ALL SPAMMABLE REMOTES WILL BE PATCHED SOON, HAVE FUN WHILE YOU CAN!")

KillerThings:CreateSection("Slacker")

local SlackerCD = 5
local SlackerABIL = "M1"
local SlackerABILS = {
    "M1",
    "Volatile Echo",
    "Imitation",
    "Juvenile Burden"
}
function SlackerAbility()
task.spawn(function()
if SlackerABIL == "Volatile Echo" then
local args = {
	"necromancer"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Monster"):FireServer(unpack(args))
elseif SlackerABIL == "Imitation" then
local args = {
	"identitytheft",
	90.0
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Monster"):FireServer(unpack(args))
elseif SlackerABIL == "Juvenile Burden" then
local args = {
	"walkspeedoverride",
	75.0
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Monster"):FireServer(unpack(args))
else
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Monster"):FireServer(SlackerABIL)
end
end)
end
KillerThings:CreateDropdown({Name = "Ability"; Options = SlackerABILS; CurrentOption = SlackerABIL; MultiSelection = false; Callback = function(Value)
SlackerABIL = TableFirstElementToString(Value)
end; })
KillerThings:CreateButton({Name = "Use Ability"; Callback = function()
SlackerAbility()
end; })
KillerThings:CreateSlider({Name = "Spam Delay"; Range = {0, 10}; Increment = .1; Suffix = "seconds"; CurrentValue = 5; Callback = function(Value)
SlackerCD = Value
end; })
KillerThings:CreateToggle({Name = "Spam Ability"; CurrentValue = false; Callback = function(Value)
SlackerSPAM = Value
if SlackerSPAM == true then
repeat task.wait(SlackerCD)
SlackerAbility()
until SlackerSPAM == false
end
end; })



KillerThings:CreateSection("Ashle")

local AshleCD = 5
local AshleABIL = "M1"
local AshleABILS = {
    "M1",
    "Suitcase",
    "Would You Look at The Time?",
}
function AshleAbility()
task.spawn(function()
if AshleABIL == "Suitcase" then
local args = {
	"throw",
	vector.create(LP.Character:WaitForChild("HumanoidRootPart").Position.X,LP.Character:WaitForChild("HumanoidRootPart").Position.Y,LP.Character:WaitForChild("HumanoidRootPart").Position.Z)
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Ashle"):FireServer(unpack(args))
elseif AshleABIL == "Would You Look at The Time?" then
local args = {
	"special"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Ashle"):FireServer(unpack(args))
else
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Ashle"):FireServer(AshleABIL)
end
end)
end
KillerThings:CreateDropdown({Name = "Ability"; Options = AshleABILS; CurrentOption = AshleABIL; MultiSelection = false; Callback = function(Value)
AshleABIL = TableFirstElementToString(Value)
end; })
KillerThings:CreateButton({Name = "Use Ability"; Callback = function()
AshleAbility()
end; })
KillerThings:CreateSlider({Name = "Spam Delay"; Range = {0, 10}; Increment = .1; Suffix = "seconds"; CurrentValue = 5; Callback = function(Value)
AshleCD = Value
end; })
KillerThings:CreateToggle({Name = "Spam Ability"; CurrentValue = false; Callback = function(Value)
AshleSPAM = Value
if AshleSPAM == true then
repeat task.wait(AshleCD)
AshleAbility()
until AshleSPAM == false
end
end; })




KillerThings:CreateSection("CubedHexa22")

local CubedHexaCD = 5
local CubedHexaABIL = "M1"
local CubedHexaABILS = {
    "M1",
    "Stable Tripmine",
    "Puncture and Skewer",
    "Crushing Zealotry"
}
function CubedHexaAbility()
task.spawn(function()
if CubedHexaABIL == "Stable Tripmine" then
local args = {
	"subspace"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CubedHexa22"):FireServer(unpack(args))
elseif CubedHexaABIL == "Puncture and Skewer" then
local args = {
	"harpoon"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CubedHexa22"):FireServer(unpack(args))
wait()
local args = {
	"harpoon_end",
	vector.create(LP.Character:WaitForChild("HumanoidRootPart").Position.X,LP.Character:WaitForChild("HumanoidRootPart").Position.Y,LP.Character:WaitForChild("HumanoidRootPart").Position.Z)
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CubedHexa22"):FireServer(unpack(args))
elseif CubedHexaABIL == "Crushing Zealotry" then
local args = {
	"slam"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CubedHexa22"):FireServer(unpack(args))
else
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CubedHexa22"):FireServer(CubedHexaABIL)
end
end)
end
KillerThings:CreateDropdown({Name = "Ability"; Options = CubedHexaABILS; CurrentOption = CubedHexaABIL; MultiSelection = false; Callback = function(Value)
CubedHexaABIL = TableFirstElementToString(Value)
end; })
KillerThings:CreateButton({Name = "Use Ability"; Callback = function()
CubedHexaAbility()
end; })
KillerThings:CreateSlider({Name = "Spam Delay"; Range = {0, 10}; Increment = .1; Suffix = "seconds"; CurrentValue = 5; Callback = function(Value)
CubedHexaCD = Value
end; })
KillerThings:CreateToggle({Name = "Spam Ability"; CurrentValue = false; Callback = function(Value)
CubedHexaSPAM = Value
if CubedHexaSPAM == true then
repeat task.wait(CubedHexaCD)
CubedHexaAbility()
until CubedHexaSPAM == false
end
end; })




KillerThings:CreateSection("Observer")

local ObserverCD = 5
local ObserverABIL = "M1"
local ObserverABILS = {
    "M1",
    "Teleportation",
    "Imperceptive Transfigure",
    "Observation Eye"
}
function ObserverAbility()
task.spawn(function()
if ObserverABIL == "Teleportation" then
local args = {
	"teleportation_rework",
	vector.create(LP.Character:WaitForChild("HumanoidRootPart").Position.X,LP.Character:WaitForChild("HumanoidRootPart").Position.Y,LP.Character:WaitForChild("HumanoidRootPart").Position.Z),
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Observer"):FireServer(unpack(args))
elseif ObserverABIL == "Imperceptive Transfigure" then
local args = {
	"RECALLTHEDEATH_rework"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Observer"):FireServer(unpack(args))
elseif ObserverABIL == "Observation Eye" then
local args = {
	"observationEyes"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Observer"):FireServer(unpack(args))
else
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Observer"):FireServer(ObserverABIL)
end
end)
end
KillerThings:CreateDropdown({Name = "Ability"; Options = ObserverABILS; CurrentOption = ObserverABIL; MultiSelection = false; Callback = function(Value)
ObserverABIL = TableFirstElementToString(Value)
end; })
KillerThings:CreateButton({Name = "Use Ability"; Callback = function()
ObserverAbility()
end; })
KillerThings:CreateSlider({Name = "Spam Delay"; Range = {0, 10}; Increment = .1; Suffix = "seconds"; CurrentValue = 5; Callback = function(Value)
ObserverCD = Value
end; })
KillerThings:CreateToggle({Name = "Spam Ability"; CurrentValue = false; Callback = function(Value)
ObserverSPAM = Value
if ObserverSPAM == true then
repeat task.wait(ObserverCD)
ObserverAbility()
until ObserverSPAM == false
end
end; })



--[[ 


   _____ ___     __ __   __  __
   
   .
   
   MAP THINGS
   
   
   

~~MAP Management


]]--


local MapObj = Window:CreateTab("Map Objectives",0)

MapObj:CreateLabel("Coming soon :3")

--[[ 


____   ____ __                     __          
\   \ /   /|__| ________ _______  |  |   ______
 \   Y   / |  |/  ___/  |  \__  \ |  |  /  ___/
  \     /  |  |\___ \|  |  // __ \|  |__\___ \ 
   \___/   |__/____  >____/(____  /____/____  >
                   \/           \/          \/ 

Visuals Management


]]--

if not game:GetService("CoreGui"):FindFirstChild("BIAST_ESP_HANDLER") then
Instance.new("Folder", game:GetService("CoreGui")).Name = "BIAST_ESP_HANDLER"
end

_G.ESPenabledHandler = false
_G.ESPtransHandler = 0.3

function CreateHighlight(plr)
task.spawn(function()
for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("BIAST_ESP_HANDLER"):GetChildren()) do
if v and v.Name == ("sillyfolder_"..plr.Name) then
v:Destroy()
end
end
repeat task.wait() until game:GetService("CoreGui"):WaitForChild("BIAST_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) == nil
local esp_folder = Instance.new("Folder")
esp_folder.Name = "sillyfolder_"..plr.Name
esp_folder.Parent = game:GetService("CoreGui"):FindFirstChild("BIAST_ESP_HANDLER")
      
repeat task.wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
local plr_char = plr.Character or plr.CharacterAdded:Wait()
for i,v in pairs(plr_char:GetChildren()) do
if v and v:IsA("BasePart") and (v.Name == "Left Leg" or v.Name == "Left Arm" or v.Name == "Right Leg" or v.Name == "Right Arm" or v.Name == "Torso" or v.Name == "Head") then
local esp = Instance.new("BoxHandleAdornment")
esp.Name = "sillygirl_"..plr.Name
esp.Adornee = v
esp.AlwaysOnTop = true
esp.ZIndex = 10 or 1
esp.Size = v.Size
esp.Transparency = (plr_char.Parent.Name == "Workspace" and 1) or tonumber(_G.ESPtransHandler)
esp.Color = (plr_char.Parent.Name == "Live" and BrickColor.new("Bright green")) or BrickColor.new("Bright red")
esp.Parent = game:GetService("CoreGui"):WaitForChild("BIAST_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name)
end
end


      
local char_connection, team_connection, dstr_connection
char_connection = plr.CharacterAdded:Connect(function()
if game:GetService("CoreGui"):WaitForChild("BIAST_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("BIAST_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
dstr_connection:Disconnect()
team_connection:Disconnect()
repeat task.wait(1.25) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
CreateHighlight(plr)
char_connection:Disconnect()
end)

team_connection = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
if game:GetService("CoreGui"):WaitForChild("BIAST_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("BIAST_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
dstr_connection:Disconnect()
char_connection:Disconnect()
repeat task.wait(1.25) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
CreateHighlight(plr)
team_connection:Disconnect()
end)

dstr_connection = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
if child.Name == "BIAST_ESP_HANDLER" then
Instance.new("Folder", game:GetService("CoreGui")).Name = "BIAST_ESP_HANDLER"
team_connection:Disconnect()
char_connection:Disconnect()
dstr_connection:Disconnect()
end      
end)


      
end)
end

function ChangeTransparency(trans)
for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("BIAST_ESP_HANDLER"):GetDescendants()) do
if v and v:IsA("BoxHandleAdornment") then
v.Transparency = trans
end
end
end

local Visual = Window:CreateTab("Visuals Management",0)

Visual:CreateSection("Players ESP （︶^︶）")

Visual:CreateLabel("Main Settings")

Visual:CreateSlider({Name = "ESP Transparency (in %)"; Range = {0, 100}; Increment = 5; Suffix = "%"; CurrentValue = 30; Callback = function(Value)
_G.ESPtransHandler = (tonumber(Value) / 100)
ChangeTransparency(tonumber(_G.ESPtransHandler))
end; })

plradded_esp = nil
plrremoved_esp = nil
Visual:CreateToggle({Name = "Turn On/Off ESP"; CurrentValue = false; Callback = function(Value)
_G.ESPenabledHandler = Value
if _G.ESPenabledHandler == true then
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if v and v ~= game:GetService("Players").LocalPlayer then
CreateHighlight(v)
end
end
plradded_esp = game:GetService("Players").PlayerAdded:Connect(function(plr)
CreateHighlight(plr)
end)
plrremoved_esp = game:GetService("Players").PlayerRemoving:Connect(function(plr)
if game:GetService("CoreGui"):WaitForChild("BIAST_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("BIAST_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
end)
Notify("Success!", "Enabled!", 4, true)
elseif _G.ESPenabledHandler == false then
game:GetService("CoreGui"):FindFirstChild("BIAST_ESP_HANDLER"):Destroy()
if plradded_esp ~= nil then
plradded_esp:Disconnect()
plradded_esp = nil
end
if plrremoved_esp ~= nil then
plrremoved_esp:Disconnect()
plrremoved_esp = nil
end
Notify("Success!", "Disabled!", 4, true)
end
end; })

Visual:CreateSection("Gui Management ε=( o｀ω′)ノ")

Visual:CreateLabel("Nothing here yet :<")

Visual:CreateSection("Director Control (⁠｡⁠♡⁠‿⁠♡⁠｡⁠)")

DialogueDur = 2
DialogueTxt = "Be ready for anything guys, you never know what's gonna happen next!"
DirectorMood = "Happy"

Visual:CreateDropdown({Name = "Director Mood"; Options = {"Happy","Angry"}; CurrentOption = "Happy"; MultiSelection = false; Callback = function(Value)
DirectorMood = TableFirstElementToString(Value)
end; })

Visual:CreateInput({Name = "Dialogue Duration ( in seconds )"; PlaceholderText = "2"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
DialogueDur = tonumber(Value)
end; })

Visual:CreateInput({Name = "Dialogue Text"; PlaceholderText = "Be ready for anything guys, you never know what's gonna happen next!"; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
DialogueTxt = tostring(Value)
end; })

Visual:CreateButton({Name = "Start Director Dialogue"; Callback = function()
game:GetService("ReplicatedStorage").IAmADirector:Fire({
        dialogue = DialogueTxt,
        duration = DialogueDur,
        icon = "director"..DirectorMood.."",
        name = "Director"
    })
end; })


--[[


   _____          __   __ 
  /  _  \   _____/  |_|__|
 /  /_\  \ /    \   __\  |
/    |    \   |  \  | |  |
\____|__  /___|  /__| |__|
        \/     \/         

Anti


]]--


local AntiThings = Window:CreateTab("Anti / Immunities",0)

AntiThings:CreateToggle({Name = "Anti-Ragdoll"; CurrentValue = false; Callback = function(Value)
AntiRagdoll = Value
if AntiRagdoll == true then
repeat task.wait(.05)
local HaveStamSettings, StamSettings = ReturnStaminaSettings()
if HaveStamSettings then
StamSettings.Parent:WaitForChild("RagdollTrigger").Value = false
end
until AntiRagdoll == false
end
end; })


AntiThings:CreateToggle({Name = "Anti-Sprint Block"; CurrentValue = false; Callback = function(Value)
AntiSprintBlock = Value
if AntiSprintBlock == true then
repeat task.wait()
local HaveStamSettings, StamSettings = ReturnStaminaSettings()
if HaveStamSettings then
StamSettings.Parent:WaitForChild("disabled").Value = false
end
until AntiSprintBlock == false
end
end; })


AntiScrollLose = false
AntiThings:CreateToggle({Name = "Anti-Scroll Lose"; CurrentValue = false; Callback = function(Value)
if not hookmetamethod or not getnamecallmethod then
Notify("Error!","Your executor doesn't support this feature! (hookmetamethod or getnamecallmethod missing)", 6, false)
return nil
end
AntiScrollLose = Value
end; })

AntiSlowness = false
AntiThings:CreateToggle({Name = "Anti-Slowness Effect"; CurrentValue = false; Callback = function(Value)
if not hookmetamethod or not getnamecallmethod then
Notify("Error!","Your executor doesn't support this feature! (hookmetamethod or getnamecallmethod missing)", 6, false)
return nil
end
AntiSlowness = Value
end; })

AntiFatigue = false
AntiThings:CreateToggle({Name = "Anti-Fatigue Effect"; CurrentValue = false; Callback = function(Value)
if not hookmetamethod or not getnamecallmethod then
Notify("Error!","Your executor doesn't support this feature! (hookmetamethod or getnamecallmethod missing)", 6, false)
return nil
end
AntiFatigue = Value
end; })

AntiDizzy = false
AntiThings:CreateToggle({Name = "Anti-Dizzy Effect"; CurrentValue = false; Callback = function(Value)
if not hookmetamethod or not getnamecallmethod then
Notify("Error!","Your executor doesn't support this feature! (hookmetamethod or getnamecallmethod missing)", 6, false)
return nil
end
AntiDizzy = Value
end; })

AntiVisibility = false
AntiThings:CreateToggle({Name = "Anti-Visibility after crouching"; CurrentValue = false; Callback = function(Value)
if not hookmetamethod or not getnamecallmethod then
Notify("Error!","Your executor doesn't support this feature! (hookmetamethod or getnamecallmethod missing)", 6, false)
return nil
end
AntiVisibility = Value
end; })


if hookmetamethod and getnamecallmethod then
pcall(function()


local Namecall
Namecall = hookmetamethod(game, "__namecall", function(self, ...)
    if (getnamecallmethod() == "FireServer" or getnamecallmethod() == "FireClient") then
        local incoming_args = {}
        for _, arg in ipairs({...}) do
            if typeof(arg) == "string" then
                table.insert(incoming_args, arg)
            end
        end
        if self.Name == "Survivor" and (incoming_args[1] == "crouching" and incoming_args[2] == true and incoming_args[3] ~= 0) then
            if AntiVisibility == true then
                return Namecall(self, unpack({"crouching",true}))
            end
        elseif self.Name == "Item" and (incoming_args[1] == "ScrollOfSevenless" and incoming_args[2] == "die") then
            if AntiScrollLose == true then
                return
            end
        elseif self.Name == "dizzy" and incoming_args[1] == true then
            if AntiDizzy == true then
                return
            end
        elseif self.Name == "status" then
            if incoming_args[1] == "slowness" then
                if AntiSlowness == true then
                    return
                end
            elseif incoming_args[1] == "fatigue" then
                if AntiFatigue == true then
                    return
                end
            end
        end
    end
    return Namecall(self, ...)
end)


end)
end




AntiThings:CreateToggle({Name = "Anti-Mango Obby Button"; CurrentValue = false; Callback = function(Value)
local mangogui = game:GetService("Players").LocalPlayer.PlayerGui["\007"] or game:GetService("Players").LocalPlayer.PlayerGui[" "] or game:GetService("Players").LocalPlayer.PlayerGui[""]
if mangogui then
-- sorry i forgot is it enabled or visible property :(
pcall(function()
mangogui.Enabled = not Value
end)
pcall(function()
mangogui.Visible = not Value
end)
end
end; })








--[[ 


___________    .__                               __   
\__    ___/___ |  |   ____ ______   ____________/  |_ 
  |    |_/ __ \|  | _/ __ \\____ \ /  _ \_  __ \   __\
  |    |\  ___/|  |_\  ___/|  |_> >  <_> )  | \/|  |  
  |____| \___  >____/\___  >   __/ \____/|__|   |__|  
             \/          \/|__|                       

Teleport


]]--

local TeleportFeatures = Window:CreateTab("Teleport",0)

TeleportFeatures:CreateSection("Team/Items Teleport (⓿_⓿)")

ChoosenKillerTarget = nil
ChoosenSurvivorTarget = nil
ChoosenItemTarget = nil
local TeleportToKillerDropdown = TeleportFeatures:CreateDropdown({Name = "Target Killer"; Options = GetChildNames(game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Killer")); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
ChoosenKillerTarget = TableFirstElementToString(Value)
end; })
TeleportFeatures:CreateButton({Name = "Teleport to Killer"; Callback = function()
if not game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Killer"):FindFirstChildOfClass("Model") then
Notify("Error!", "There are no killers!", 3, false)
return nil
end
if ChoosenKillerTarget == nil or ChoosenKillerTarget == "" or not ChoosenKillerTarget then
Notify("Error!", "Choose your target!", 3, false)
return nil
end
SafeTeleport(game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Killer"):FindFirstChild(ChoosenKillerTarget):WaitForChild("HumanoidRootPart"))
end; })
game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Killer").ChildAdded:Connect(function(child)
pcall(function()
TeleportToKillerDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Killer")))
end)
end)
game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Killer").ChildRemoved:Connect(function(child)
pcall(function()
TeleportToKillerDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Killer")))
end)
end)

local TeleportToSurvivorDropdown = TeleportFeatures:CreateDropdown({Name = "Target Survivor"; Options = GetChildNames(game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Live")); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
ChoosenSurvivorTarget = TableFirstElementToString(Value)
end; })
TeleportFeatures:CreateButton({Name = "Teleport to Survivor"; Callback = function()
if not game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Live"):FindFirstChildOfClass("Model") then
Notify("Error!", "There are no survivors!", 3, false)
return nil
end
if ChoosenSurvivorTarget == nil or ChoosenSurvivorTarget == "" or not ChoosenSurvivorTarget then
Notify("Error!", "Choose your target!", 3, false)
return nil
end
SafeTeleport(game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Live"):FindFirstChild(ChoosenSurvivorTarget):WaitForChild("HumanoidRootPart"))
end; })
game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Live").ChildAdded:Connect(function(child)
pcall(function()
TeleportToSurvivorDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Live")))
end)
end)
game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Live").ChildRemoved:Connect(function(child)
pcall(function()
TeleportToSurvivorDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Live")))
end)
end)

TeleportFeatures:CreateSection("Specific Teleports ლ(╹◡╹ლ)")

TeleportFeatures:CreateButton({Name = "Teleport to Injured survivor"; Callback = function()
local injuredplr = nil
for i,v in pairs(game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Live"):GetChildren()) do
if v and v.Parent and (v:WaitForChild("Humanoid").Health < tonumber(v:WaitForChild("Humanoid").MaxHealth)) then
injuredplr = v
end
end
if injuredplr then
SafeTeleport(injuredplr:WaitForChild("HumanoidRootPart"))
else
Notify("Error!", "There are no injured players!", 3, false)
end
end; })


--[[ 


__________                         __               
\______   \_______   ____   _____ |__|__ __  _____  
 |     ___/\_  __ \_/ __ \ /     \|  |  |  \/     \ 
 |    |     |  | \/\  ___/|  Y Y  \  |  |  /  Y Y  \
 |____|     |__|    \___  >__|_|  /__|____/|__|_|  /
                        \/      \/               \/  

Premium


]]--

local PremiumFeatures = Window:CreateTab("Premium",0)

-- Get Price { regional price }
function GetPrice(assetid)
local product_id = tonumber(assetid) or assettid
local product_info = game:GetService("MarketplaceService"):GetProductInfo(product_id)
local product_price = product_info.PriceInRobux
return tostring(product_price)
end

function HavePremium()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game:GetService("Players").LocalPlayer.UserId, 1264479709) or CheckIfUserInGroup() == true or getgenv().BIASTnhPremium == true then
return true
end
return false
end

wait()

local idkwhatthisis = HavePremium()

function OpenLink(link)
local url = tostring(link)
local function copylink()
setclipboard(url)
Notify("Success!", "Copied Link!", 10, true)
end
if openweb then
local suc, err = pcall(function() openweb(url) end) if not suc then copylink() end
elseif WebHandler then
local suc, err = pcall(function() WebHandler:OpenWeb(url) end) if not suc then copylink() end
else
copylink()
end
end

function ErrorPremium()
Notify("Error!", "You don't have premium!")
end

local pprice = pcall(GetPrice(1418926689)) or 39

PremiumFeatures:CreateLabel("There's currently 2 ways to get unlock premium features")

PremiumFeatures:CreateLabel("")

PremiumFeatures:CreateLabel("Buy gamepass to unlock premium features! [ Cost "..pprice.." robux ]")

PremiumFeatures:CreateButton({Name = "Open Gamepass Link"; Callback = function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game:GetService("Players").LocalPlayer.UserId, 1418926689) then
    Notify("Error!", "Arleady have gamepass!", 4)
else
    OpenLink("https://www.roblox.com/game-pass/1418926689")
end
end; })

PremiumFeatures:CreateButton({Name = "Copy Gamepass Link"; Callback = function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game:GetService("Players").LocalPlayer.UserId, 1418926689) then
    Notify("Error!", "Arleady have gamepass!", 4)
else
    setclipboard(tostring("https://www.roblox.com/game-pass/1418926689"))
    Notify("Success!", "Copied Link!", 10, true)
end
end; })

PremiumFeatures:CreateLabel("or join our roblox group to unlock premium features!")

PremiumFeatures:CreateButton({Name = "Open Group Link"; Callback = function()
if CheckIfUserInGroup() == true then
    Notify("Error!", "Arleady joined group!", 4)
else
    OpenLink("https://www.roblox.com/communities/35649714/my-group-nexer1234#!/about")
end
end; })

PremiumFeatures:CreateButton({Name = "Copy Group Link"; Callback = function()
if CheckIfUserInGroup() == true then
    Notify("Error!", "Arleady joined group!", 4)
else
    setclipboard(tostring("https://www.roblox.com/communities/35649714/my-group-nexer1234#!/about"))
    Notify("Success!", "Copied Link!", 10, true)
end
end; })

PremiumFeatures:CreateLabel("")

PremiumFeatures:CreateSection("Killing / Flinging Killers ::>_<::")

PremiumFeatures:CreateLabel("Not done yet.")

PremiumFeatures:CreateSection("Advanced Anti (｡･∀･)ﾉﾞ")

PremiumFeatures:CreateToggle({Name = "This does nothing."; CurrentValue = false; Callback = function(Value)
if HavePremium() ~= true then
ErrorPremium()
return nil
end
AntiStun = Value
if AntiStun == true then
Notify("Success!", "Anti-Stun is now enabled!", 4, true)
repeat task.wait()
until AntiStun == false
end
end; })

PremiumFeatures:CreateSection("Money Farm $o$")

PremiumFeatures:CreateLabel("For this to work, go to your friend/alt/afk contractee as slacker, this contractee SHOULD NOT MOVE!! Then stand like 6 studs away from him, and also your body have to look at him! Then press this button below, remember, it will lag a lot and you have only 1 chance. If succeeded, you get up to 5000 money.")

PremiumFeatures:CreateButton({Name = "Use slacker rush 1000 times"; Callback = function()
if HavePremium() ~= true then
ErrorPremium()
return nil
end
LP.Character:WaitForChild("HumanoidRootPart").Anchored = true
wait()
for i = 1,1000 do
local args = {
	"walkspeedoverride",
	70.0
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Monster"):FireServer(unpack(args))
end
end; })

PremiumFeatures:CreateSection("Silly animations UwU")

local preferedanimat
preferedanimat = "ashle intro"
PremiumFeatures:CreateDropdown({Name = "Animation"; Options = {"ashle intro","dead","Put yo hands up!","RISEEEEE","crashout"}; CurrentOption = "ashle intro"; MultiSelection = false; Callback = function(Value)
preferedanimat = TableFirstElementToString(Value)
end; })

local function PlayAnim(id)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..id
local loadedanim = LP.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Anim)
repeat task.wait() until loadedanim.Length > 0	
loadedanim:Play()
repeat task.wait() until loadedanim.IsPlaying
end

PremiumFeatures:CreateButton({Name = "Play Choosen Anim"; Callback = function()
if HavePremium() ~= true then
ErrorPremium()
return nil
end
if preferedanimat == "ashle intro" then
for i,v in pairs(LP.Character:GetDescendants()) do
if v and v:IsA("BasePart") and v.CanCollide == true and v.Name ~= "HumanoidRootPart" then
v.CanCollide = false
end
end
if LP.Character:FindFirstChild("HumanoidRootPart") then
LP.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
end
PlayAnim(tostring(125850211102377))
elseif preferedanimat == "dead" then
PlayAnim(tostring(87985090734542))
elseif preferedanimat == "Put yo hands up!" then
PlayAnim(tostring(134659001382428))
elseif preferedanimat == "RISEEEEE" then
PlayAnim(tostring(130941109974282))
elseif preferedanimat == "crashout" then
PlayAnim(tostring(83440316021538))
end
Notify("Success!", "Activated animation!", 4, true)
end; })


--[[

LP = game.Players.LocalPlayer
function nocollision()
for i,v in pairs(LP.Character:GetDescendants()) do
if v and v:IsA("BasePart") and v.CanCollide == true then
v.CanCollide = false
end
end
if LP.Character:FindFirstChild("HumanoidRootPart") then
LP.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
end
end
Noclipping = RunService.Stepped:Connect(nocollision)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://90444351114401"
local loadedanim = LP.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Anim)
loadedanim.Priority = Enum.AnimationPriority.Action4
repeat task.wait() until loadedanim.Length > 0	
loadedanim:Play()
repeat task.wait() until loadedanim.IsPlaying
loadedanim:AdjustSpeed(tonumber(0))
loadedanim.TimePosition = 2.2

]]--

function StopAllAnims()
task.spawn(function()
local stopper = LP.Character:FindFirstChildOfClass("Humanoid") or LP.Character:FindFirstChildOfClass("AnimationController") 
for i,v in next, stopper:GetPlayingAnimationTracks() do
v.Priority = Enum.AnimationPriority.Core
v:AdjustSpeed(tonumber(0))
v:Stop(tonumber(0))
end
end)
end
-- .TimePosition :AdjustSpeed()
PremiumFeatures:CreateButton({Name = "Stop All Anims"; Callback = function()
if HavePremium() ~= true then
ErrorPremium()
return nil
end
StopAllAnims()
Notify("Success!", "Stopped all animations!", 4, true)
end; })



local plate_name = "meowl"
function InvisibilityMode(mode)
if workspace:FindFirstChild(tostring(plate_name)) == nil then
local S = Instance.new("Part")
S.Name = tostring(plate_name)
S.Anchored = true
S.CanCollide = true
S.Transparency = 0
S.Position = Vector3.new(0,500,0)
S.Size = Vector3.new(20, 10, 20)
S.Parent = workspace
end
local Player = game:GetService("Players").LocalPlayer
local Camera = workspace:FindFirstChild("CurrentCamera") or workspace:FindFirstChild("Camera") or workspace:FindFirstChildOfClass("CurrentCamera") or workspace:FindFirstChildOfClass("Camera")
if mode == "on" or mode == true then
Player.Character.Archivable = true
InvisChar = Player.Character:Clone()
InvisChar.Parent = workspace
InvisChar:WaitForChild("HumanoidRootPart").CFrame = Player.Character:WaitForChild("HumanoidRootPart").CFrame
InvisChar.Name = tostring(math.random(1,99999999999))
Camera.CameraSubject = InvisChar:FindFirstChildOfClass("Humanoid")
task.wait(.1)
Player.Character:WaitForChild("HumanoidRootPart").CFrame = workspace:FindFirstChild(tostring(plate_name)).CFrame * CFrame.new(0,20,0)
Player.Character:FindFirstChildOfClass("Humanoid"):MoveTo(Vector3.new(workspace:FindFirstChild(tostring(plate_name)).Position.X, 9e9, workspace:FindFirstChild(tostring(plate_name)).Position.Z))
task.wait(1.5)
for i,v in pairs(InvisChar:GetDescendants()) do
	if v and v:IsA("BasePart") then
		if v.Name == "HumanoidRootPart" then
			v.Transparency = 1
		else
			if v.Transparency ~= 1 then
				v.Transparency = .5
			end
		end
	end
end
Player.Character.Parent = game:GetService("LogService")
Player.Character = InvisChar
pcall(function()
Player.Character.Animate.Disabled = true
Player.Character.Animate.Disabled = false
end)
for i,v in pairs(Player.PlayerGui.MainGui.Abilities:GetChildren()) do
if v and v:IsA("ImageButton") then
v.Visible = false
end
end
InvisCharDied = InvisChar:FindFirstChildOfClass("Humanoid").Died:Connect(function()
	pcall(function()
		task.spawn(function()
			if InvisChar then
				for i,v in ipairs(game:GetService("LogService"):GetDescendants()) do
					if v then
						v.Parent = workspace
						v:WaitForChild("HumanoidRootPart").CFrame = InvisChar:WaitForChild("HumanoidRootPart").CFrame
						Player.Character = v
						break
					end
				end
				InvisChar:Destroy()
				InvisChar = nil
			end
		end)
	end)
	pcall(function()
		task.spawn(function()
			if InvisCharDied then
				InvisCharDied:Disconnect()
				InvisCharDied = nil
			end
		end)
	end)
	pcall(function()
	Camera.CameraSubject = Player.Character:FindFirstChildOfClass("Humanoid")
	end)
	pcall(function()
	Player.Character.Animate.Disabled = true
	Player.Character.Animate.Disabled = false
	end)
end)
elseif mode == "off" or mode == false then
if InvisChar then
	for i,v in ipairs(game:GetService("LogService"):GetDescendants()) do
		if v then
			v.Parent = workspace
			v:WaitForChild("HumanoidRootPart").CFrame = InvisChar:WaitForChild("HumanoidRootPart").CFrame
			Player.Character = v
			break
		end
	end
	InvisChar:Destroy()
	InvisChar = nil
end
if InvisCharDied then
	InvisCharDied:Disconnect()
	InvisCharDied = nil
end
Camera.CameraSubject = Player.Character:FindFirstChildOfClass("Humanoid")
pcall(function()
Player.Character.Animate.Disabled = true
Player.Character.Animate.Disabled = false
end)
end
end

PremiumFeatures:CreateSection("Invisibility (°°)～")

local InvisibilityType
InvisibilityType = "Invisibility (can use abilities, your body goes underground)"
PremiumFeatures:CreateDropdown({Name = "Invisibility Mode"; Options = {"Invisibility (can use abilities, your body goes underground)","Invisibility (can use abilities, only invisible to killer)","Invisibility + Invincibility (can't use abilities)"}; CurrentOption = "Invisibility (can use abilities, your body goes underground)"; MultiSelection = false; Callback = function(Value)
InvisibilityType = TableFirstElementToString(Value)
end; })

noclip_connection = nil
camera_connection = nil
PremiumFeatures:CreateToggle({Name = "Turn On/Off Invisibility"; CurrentValue = false; Callback = function(Value)
if HavePremium() ~= true then
ErrorPremium()
return nil
end
if Value == false then
StopAllAnims()
if camera_connection then
camera_connection:Disconnect()
camera_connection = nil
end
InvisibilityMode("off")
if noclip_connection then
noclip_connection:Disconnect()
noclip_connection = nil
end
local args = {
	"crouching",
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Survivor"):FireServer(unpack(args))
LP.Character:FindFirstChildOfClass("Humanoid").HipHeight = 0
Notify("Success!", "Disabled invisibility!", 4, true)
elseif Value == true then
if InvisibilityType == "Invisibility (can use abilities, your body goes underground)" then		
local function nocollision()
for i,v in pairs(LP.Character:GetDescendants()) do
if v and v:IsA("BasePart") and v.CanCollide == true and v.Name ~= "HumanoidRootPart" then
v.CanCollide = false
end
end
if LP.Character:FindFirstChild("HumanoidRootPart") then
LP.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
end
end
noclip_connection = game:GetService("RunService").Stepped:Connect(nocollision)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://97651331033412"
local loadedanim = LP.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Anim)
loadedanim.Priority = Enum.AnimationPriority.Action4
repeat task.wait() until loadedanim.Length > 0	
loadedanim:Play()
repeat task.wait() until loadedanim.IsPlaying
loadedanim:AdjustSpeed(tonumber(0))
loadedanim.TimePosition = 1.6
wait(.1)
workspace.CurrentCamera.CameraSubject = LP.Character:WaitForChild("HumanoidRootPart")
camera_connection = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
workspace.CurrentCamera.CameraSubject = LP.Character:WaitForChild("HumanoidRootPart")
end)
LP.Character:FindFirstChildOfClass("Humanoid").HipHeight = -1
Notify("Success!", "Applied invisibility!", 4, true)
elseif InvisibilityType == "Invisibility (can use abilities, only invisible to killer)" then
local args = {
	"crouching",
	false
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Survivor"):FireServer(unpack(args))
Notify("Success!", "Applied invisibility!", 4, true)
elseif InvisibilityType == "Invisibility + Invincibility (can't use abilities)" then
Notify("Success!", "Applying invisibility... Please don't move!", 2, true)
InvisibilityMode("on")
Notify("Success!", "Applied invisibility!", 4, true)
end
end
end; })

PremiumFeatures:CreateSection("FE Ban ԅ(¯﹃¯ԅ)")

PremiumFeatures:CreateLabel("not done")

PremiumFeatures:CreateLabel("More coming very and very soon!!! :)")


--[[ 


   _____          __                __   __               
  /  _  \   ____ |__| _____ _____ _/  |_|__| ____   ____  
 /  /_\  \ /    \|  |/     \\__  \\   __\  |/  _ \ /    \ 
/    |    \   |  \  |  Y Y  \/ __ \|  | |  (  <_> )   |  \
\____|__  /___|  /__|__|_|  (____  /__| |__|\____/|___|  /
        \/     \/         \/     \/                    \/ 

Animations Changer


]]--

local function ReturnAnimFolder()
if LP.Character and LP.Character:FindFirstChild("Animate") then
return LP.Character:WaitForChild("Animate")
end
return nil
end

local Animation = Window:CreateTab("Animations Changer",0)
Animation:CreateSection("Animation Changer o(≧口≦)o")

local function SetAnim(run, walk, idle)

local stopper = LP.Character:FindFirstChildOfClass("Humanoid") or LP.Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end

local AnimationFolder = ReturnAnimFolder()

pcall(function()
AnimationFolder:WaitForChild("run"):WaitForChild("RunAnim").AnimationId = run
end)
pcall(function()
AnimationFolder:WaitForChild("walk"):WaitForChild("WalkAnim").AnimationId = walk
end)
pcall(function()
AnimationFolder:WaitForChild("idle"):WaitForChild("Animation1").AnimationId = idle
end)
pcall(function()
AnimationFolder:WaitForChild("idle"):WaitForChild("Animation2").AnimationId = idle
end)
pcall(function()
LP.Character.Animate.Disabled = true
LP.Character.Animate.Disabled = false
end)

end

Animation:CreateLabel("Contractee Animations")
Animation:CreateButton({Name = "Apply Contractee Animations"; Callback = function()
local RunAnim = "rbxassetid://73757068764895"
local WalkAnim = "rbxassetid://114401293985578"
local IdleAnim = "rbxassetid://125057787855792"
task.spawn(function()
SetAnim(RunAnim, WalkAnim, IdleAnim)
end)
Notify("Success!", "Applied civilian animations!", 3, true)
end; })

Animation:CreateLabel("Killer Animations")
Animation:CreateButton({Name = "Apply Slacker Animations"; Callback = function()
local RunAnim = "rbxassetid://106126161477918"
local WalkAnim = "rbxassetid://106126161477918"
local IdleAnim = "rbxassetid://85460520672095"
task.spawn(function()
SetAnim(RunAnim, WalkAnim, IdleAnim)
end)
Notify("Success!", "Applied slacker animations!", 3, true)
end; })
Animation:CreateButton({Name = "Apply Ashle Animations"; Callback = function()
local RunAnim = "rbxassetid://84457725713164"
local WalkAnim = "rbxassetid://89077499655833"
local IdleAnim = "rbxassetid://108803054326477"
task.spawn(function()
SetAnim(RunAnim, WalkAnim, IdleAnim)
end)
Notify("Success!", "Applied ashle animations!", 3, true)
end; })
Animation:CreateButton({Name = "Apply CubedHexa22 Animations"; Callback = function()
local RunAnim = "rbxassetid://105766326696520"
local WalkAnim = "rbxassetid://105766326696520"
local IdleAnim = "rbxassetid://73768145520513"
task.spawn(function()
SetAnim(RunAnim, WalkAnim, IdleAnim)
end)
Notify("Success!", "Applied devesto animations!", 3, true)
end; })

Animation:CreateLabel("Admin Animations")
Animation:CreateButton({Name = "Apply Devesto Animations"; Callback = function()
local RunAnim = "rbxassetid://124903486407582"
local WalkAnim = "rbxassetid://106826386486326"
local IdleAnim = "rbxassetid://101579819703319"
task.spawn(function()
SetAnim(RunAnim, WalkAnim, IdleAnim)
end)
Notify("Success!", "Applied devesto animations!", 3, true)
end; })


Animation:CreateLabel("More Animations Coming Soon! :)")






--[[ 


________   __   __                  
\_____  \_/  |_|  |__   ___________ 
 /   |   \   __\  |  \_/ __ \_  __ \
/    |    \  | |   Y  \  ___/|  | \/
\_______  /__| |___|  /\___  >__|   
        \/          \/     \/       

Other things, idk, why are you even skidding my script breeeeh


]]--

local Other = Window:CreateTab("Other",0)

Other:CreateButton({Name = "Hide hitboxes ( rejoin to able to see hitboxes again )"; Callback = function()
pcall(function()
workspace.Misc:Destroy()
end)
end; })

Other:CreateDropdown({Name = "Gui Theme"; Options = {"Amethyst","Default","AmberGlow","Bloom","DarkBlue","Green","Light","Ocean","Serenity"}; CurrentOption = "Ocean"; MultiSelection = false; Callback = function(Value)
Window.ModifyTheme(TableFirstElementToString(Value))
end; })

Other:CreateButton({Name = "Close Hub"; Callback = function()
pcall(function()
Window:Destroy()
end)
pcall(function()
Rayfield:Destroy()
end)
pcall(function()
game.CoreGui.Rayfield:Destroy()
end)
pcall(function()
game.CoreGui.RayField:Destroy()
end)
pcall(function()
game.CoreGui.OldRayfield:Destroy()
end)
pcall(function()
game.CoreGui.OldRayField:Destroy()
end)
end; })




if not getgenv().loadedflip_BIAST then
getgenv().loadedflip_BIAST = true
local sausageHolder = game.CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
local originalSize = sausageHolder.Size.X.Offset
local sSize = UDim2.new(0, originalSize + 48, 0, sausageHolder.Size.Y.Offset)

local buttonFrame = Instance.new("Frame", sausageHolder)
		buttonFrame.Size = UDim2.new(0, 48, 0, 44)
		buttonFrame.BackgroundTransparency = 1
		buttonFrame.BorderSizePixel = 0
		buttonFrame.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
local imageButton = Instance.new("ImageButton", buttonFrame)
		imageButton.BackgroundTransparency = 1
		imageButton.BorderSizePixel = 0
		imageButton.Size = UDim2.new(0, 36, 0, 36)
		imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
		imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		imageButton.Image = "rbxthumb://type=Asset&id=2714338264&w=150&h=150"
function FortniteFlips()
		if FlipCooldown then
			return
		end

		FlipCooldown = true
		local character = game:GetService("Players").LocalPlayer.Character
		local hrp = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
		if not hrp or not humanoid then
			FlipCooldown = false
			return
		end

		local savedTracks = {}

		if animator then
			for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
				savedTracks[#savedTracks + 1] = { track = track, time = track.TimePosition }
				track:Stop(0)
			end
		end

		humanoid:ChangeState(Enum.HumanoidStateType.Physics)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)

		local duration = 0.45
		local steps = 120
		local startCFrame = hrp.CFrame
		local forwardVector = startCFrame.LookVector
		local upVector = Vector3.new(0, 1, 0)
		task.spawn(function()
			local startTime = tick()
			for i = 1, steps do
				local t = i / steps
				local height = 4 * (t - t ^ 2) * 10
				local nextPos = startCFrame.Position + forwardVector * (35 * t) + upVector * height
				local rotation = startCFrame.Rotation * CFrame.Angles(-math.rad(i * (360 / steps)), 0, 0)

				hrp.CFrame = CFrame.new(nextPos) * rotation
				local elapsedTime = tick() - startTime
				local expectedTime = (duration / steps) * i
				local waitTime = expectedTime - elapsedTime
				if waitTime > 0 then
					task.wait(waitTime)
				end
			end

			hrp.CFrame = CFrame.new(startCFrame.Position + forwardVector * 35) * startCFrame.Rotation
			humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
			humanoid:ChangeState(Enum.HumanoidStateType.Running)

			if animator then
				for _, data in ipairs(savedTracks) do
					local track = data.track
					track:Play()
					track.TimePosition = data.time
				end
			end
			task.wait(0.25)
			FlipCooldown = false
		end)
	end

imageButton.Activated:Connect(FortniteFlips)

sausageHolder.Size = sSize
buttonFrame.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)

task.delay(0, function()
task.spawn(function()
while task.wait(0.0003) do
sausageHolder.Size = sSize
buttonFrame.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
end
end)
end)
end

function getwebhook()
    local webhook = loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Forsaken/Http/Webhook.dll'))()
    return webhook
end

pcall(function()
req = request or http_request or HttpPost or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or (game and game.HttpPost) or (KRNL and KRNL.request) or (Xeno and Xeno.request) or (roblox and roblox.request) or (rbx and rbx.request)
if req then
local data = {
    ["username"] = "Execution Bot",
    ["avatar_url"] = "https://i.imgur.com/a/SbPHgnH",
    ["content"] = "@everyone "..LP.Name.." executed BIAST Nexer Hub **SO SIGMA!**",
    ["embeds"] = {
       {
           ["title"] = "General Info",
           ["description"] = "Username: "..LP.Name..". Executor: "..identifyexecutor()..". Roblox Profile: [Click](https://www.roblox.com/users/"..LP.UserId.."/profile)",    
           ["type"] = "rich",
           ["color"] = 1000000,
           ["footer"] = {
             ["text"] = ""..game.JobId.."",
           },
       },
   }
}
local url = getwebhook()
local datab = game:GetService("HttpService"):JSONEncode(data)
local head = {
    ["content-type"] = "application/json"
}
req({Url = url, Body = datab, Method = "POST", Headers = head})
end
end)

end)
if not ScriptLaunched then
print(ScriptError)
warn(ScriptError)
error(ScriptError)
pcall(function()
Window:Destroy()
end)
pcall(function()
Rayfield:Destroy()
end)
pcall(function()
game.CoreGui.Rayfield:Destroy()
end)
pcall(function()
game.CoreGui.RayField:Destroy()
end)
pcall(function()
game.CoreGui.OldRayfield:Destroy()
end)
pcall(function()
game.CoreGui.OldRayField:Destroy()
end)
end
