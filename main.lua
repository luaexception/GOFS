-- GOFS
-- [good or fucked (and) shit]
-- turn an object into a string and vice versa

local GOFS = {}

function GOFS:Stringify(Object: any)
	assert(Object, "No argument provided.")
	local BlacklistedObjects = {"string", "number", "table", "function", "boolean", "thread"}
	if table.find(BlacklistedObjects, type(BlacklistedObjects):lower()) then
		error("Passed object ["..tostring(Object).."] is a "..type(Object).." (a member of blacklisted objects)", 0)
	end
	return "game." .. Object:GetFullName()
end

function GOFS:Objectify(String: string)
	local Object = game
	local Directory = String:gsub("game.", ""):split(".")
	for index, Directory in ipairs(Directory) do
		if Object:FindFirstChild(Directory) == nil then
			warn(Directory.."is not a valid member of "..Object)
			return nil
		end
		Object = Object:FindFirstChild(Directory)
	end
	return Object
end

return GOFS
