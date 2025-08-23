-- Follower Checker by Nexer1234

local RequiredUserID = 7529992299

function ReturnURL(which, cursor)
local qqz = which or 1
local zzx = (cursor and "&cursor="..cursor.."") or "&cursor="
if qqz == 1 then
return "https://friends.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId.."/followings?sortOrder=Des&limit=100"..zzx
else
return "https://friends.roproxy.com/v1/users/"..game.Players.LocalPlayer.UserId.."/followings?sortOrder=Des&limit=100"..zzx
end
end

function CheckIfUserFollowed()
ft = {}
Decode = nil
repeat
if Decode == nil then
Decode = game:GetService("HttpService"):JSONDecode(game:HttpGet(ReturnURL(1))) or game:GetService("HttpService"):JSONDecode(game:HttpGet(ReturnURL("backup")))
end
if not Decode["data"] or Decode["errors"] then return false end
for i,v in pairs(Decode["data"]) do
if v ~= nil and v["id"] then
table.insert(ft, v["id"])
end
end
if Decode["nextPageCursor"] ~= nil then
Decode = nil
Decode = game:GetService("HttpService"):JSONDecode(game:HttpGet(ReturnURL(1, Decode["nextPageCursor"]))) or game:GetService("HttpService"):JSONDecode(game:HttpGet(ReturnURL("backup", Decode["nextPageCursor"])))
end
until Decode["nextPageCursor"] == nil
if table.find(ft,tonumber(RequiredUserID)) then
return true
end
return false
end

if CheckIfUserFollowed() == true then
loadstring(game:HttpGet("https://raw.githubusercontent.com/nexeralt/BIAST/refs/heads/main/main.lua"))()
return nil
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
time = time or 10
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

pcall(function()
WebHandler = loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/CustomFunctions/refs/heads/main/funcs.txt"))()
end)

Window = Rayfield:CreateWindow({
   Name = "Nexer Hub - Launcher",
   Icon = 0,    
   LoadingTitle = "Nexer Hub Launcher",
   LoadingSubtitle = "by nexer",
   Theme = "Amethyst",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

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
      Title = "Verify yourself firstly!",
      Subtitle = "Key Needed!",
      Note = "The key is ''cheese''",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"cheese"}
   }
})

local Main = Window:CreateTab("Main",85436299122876)

function CopyLink(link)
local url = tostring(link)
setclipboard(url)
Notify("Success!", "Copied Link!", 10, true)
end

function OpenLink(link)
local url = tostring(link)
if openweb then
local suc, err = pcall(function() openweb(url) end) if not suc then CopyLink(url) end
elseif WebHandler then
local suc, err = pcall(function() WebHandler:OpenWeb(url) end) if not suc then CopyLink(url) end
else
CopyLink(url)
end
end

Main:CreateParagraph({Title = "Support me!", Content = "This script was difficult to create, so please consider following to specific user in order to use this script! ( no key )"})

Main:CreateButton({Name = "Open Profile"; Callback = function()
OpenLink("https://www.roblox.com/users/"..tostring(RequiredUserID).."/profile")
end; })

Main:CreateButton({Name = "Copy Profile Link"; Callback = function()
CopyLink("https://www.roblox.com/users/"..tostring(RequiredUserID).."/profile")
end; })

Main:CreateButton({Name = "Launch Script"; Callback = function()
if CheckIfUserFollowed() == true then
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
Notify("Success!", "Launching script, please wait...", 10, true)
loadstring(game:HttpGet("https://raw.githubusercontent.com/nexeralt/BIAST/refs/heads/main/main.lua"))()
else
Notify("Error!", "You aren't followed! ( If you arleady followed, wait for about 5 minutes and try again )")
end
end; })
