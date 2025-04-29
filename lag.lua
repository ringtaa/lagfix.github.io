-- Remove resource-heavy effects
for _, obj in pairs(workspace:GetDescendants()) do
    if obj:IsA("ParticleEmitter") or obj:IsA("Light") or obj:IsA("Beam") or obj:IsA("Decal") then
        obj:Destroy()
    end
end

-- Adjust lighting
local lighting = game:GetService("Lighting")
lighting.GlobalShadows = false
lighting.Brightness = 1
lighting.Ambient = Color3.new(1, 1, 1)

-- Reduce texture quality
for _, mesh in pairs(workspace:GetDescendants()) do
    if mesh:IsA("MeshPart") then
        mesh.TextureID = "" -- Remove textures for less GPU demand
    end
end
