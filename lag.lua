-- Services
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local ContentProvider = game:GetService("ContentProvider")

-- Remove Unnecessary Visual Effects
for _, obj in pairs(workspace:GetDescendants()) do
    if obj:IsA("ParticleEmitter") or obj:IsA("Beam") or obj:IsA("Decal") or obj:IsA("Smoke") then
        obj:Destroy() -- Remove effects to free GPU usage
    elseif obj:IsA("MeshPart") then
        obj.TextureID = "" -- Remove textures for better performance
    elseif obj:IsA("Script") then
        obj.Disabled = true -- Disable unused scripts
    end
end

-- Lighting Optimizations
Lighting.GlobalShadows = false -- Disable shadows
Lighting.Brightness = 1 -- Reduce lighting complexity
Lighting.Ambient = Color3.new(1, 1, 1) -- Simplify ambient lighting

-- Reduce Physics Overload
settings().Physics.AllowSleep = true -- Let idle objects sleep to reduce updates
settings().Physics.ThrottleAdjustTime = 5 -- Lower physics refresh rate

-- Optimize Streaming (if enabled)
local player = game.Players.LocalPlayer
player:RequestStreamAroundAsync(player.Character and player.Character.PrimaryPart.Position or Vector3.new(0, 0, 0))

-- Reduce Rendering Load
RunService:Set3dRenderingEnabled(false) -- Disable 3D rendering in extreme cases
task.wait(5) -- Wait 5 seconds before re-enabling
RunService:Set3dRenderingEnabled(true) -- Turn it back on after boosting FPS

-- Preload Critical Assets
for _, obj in pairs(workspace:GetDescendants()) do
    if obj:IsA("Model") or obj:IsA("MeshPart") then
        ContentProvider:PreloadAsync({obj})
    end
end

print("FPS Booster Applied!")
