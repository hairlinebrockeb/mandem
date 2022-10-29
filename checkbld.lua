repeat task.wait(); until game.ReplicatedStorage:FindFirstChild('Settings')
repeat task.wait(); until game.ReplicatedStorage:FindFirstChild('Settings'):FindFirstChild(game.Players.LocalPlayer.Name)
local folder = game.ReplicatedStorage:FindFirstChild('Settings'):FindFirstChild(game.Players.LocalPlayer.Name)
repeat task.wait(); until folder:FindFirstChild('Bloodline');
--print(folder:FindFirstChild('Bloodline').Value)
local function get(x) return(x.v.Value) end
local NotifyLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))()
local Notify = NotifyLibrary.Notify; Notify({Title = 'Holy Shit AZFAKE';Description = get({v= folder:FindFirstChild('Bloodline')})})






-- task.wait(2)
-- Notify({Title = 'Holy Shit AZFAKE';Description = 'Tp menu'})
-- if get({v= folder:FindFirstChild('Bloodline')}) ~= 'Uzumaki' then 
--     game:GetService('TeleportService'):teleport(5571328985)
-- end
