-- config
local repoName = "executor-gui"
local repoOwner = "jLn0n"
-- variables
local http_request = (syn and syn.request) or (http and http.request) or request or http_request
local wrapperEnv = {}
local loadedImports = {}
-- functions
local function wrapFuncGlobal(func, customFenv)
	customFenv = customFenv or {}
	local fenvCache = getfenv()
	local fenv = setmetatable({}, {
		__index = function(_, index)
			return customFenv[index] or fenvCache[index]
		end,
		__newindex = function(_, index, value)
			customFenv[index] = value
		end
	})

	return setfenv(func, fenv)
end

local function fetchFile(path, branch)
	branch = (branch or "main")
	local result = (
		if not wrapperEnv.DEV_MODE then
			http_request({
				Url = string.format("https://raw.githubusercontent.com/%s/%s/%s/%s", repoOwner, repoName, branch, path),
				Method = "GET",
				Headers = {
					["Content-Type"] = "text/html; charset=utf-8",
				}
			})
		else {Success = true}
	)
	local srcFile = (if (result.Success) then result.Body else nil)
	local sepPath = string.split(path, "/")
	table.insert(sepPath, 1, branch)
	local currentPath = repoName

	for pathIndex, pathStr in sepPath do
		if pathIndex == #sepPath then
			currentPath ..= ("/" .. pathStr)
			local localSrcFile = (if isfile(currentPath) then readfile(currentPath) else nil)

			if (wrapperEnv.DEV_MODE or not result.Success) then -- if DEV_MODE or file fetch failed then we load local file
				if localSrcFile then
					srcFile = localSrcFile
					warn(string.format("Loading local file '%s' from branch `%s`.", path, branch))
				else
					warn(string.format("Failed to load `%s` of branch `%s` from the repository.", path, branch))
				end
			else -- loads the fetched file online
				if (localSrcFile ~= srcFile) then
					writefile(currentPath, srcFile)
				end
			end
		else
			currentPath ..= ("/" .. pathStr)
			if not isfolder(currentPath) then makefolder(currentPath) end
		end
	end
	return (result.Success), srcFile
end

local function import(path, branch)
	branch = (branch or "main")
	local importName = branch .. "|" .. path
	local loadedFile = loadedImports[importName]

	if not loadedFile then
		local fetchSucc, srcFile = fetchFile(path, branch)

		if not fetchSucc then return end
		loadedFile = wrapFuncGlobal(loadstring(srcFile, string.format("@%s/%s", repoName, path)), wrapperEnv)
		loadedImports[importName] = loadedFile
	end
	return loadedFile
end

--[[local function loadAsset(path, branch) -- DOESN'T WORK
	branch = (branch or "main")
	local assetId = (getcustomasset(`{repoName}/{branch}/{path}`) or "rbxassetid://0")

	return assetId
end--]]
-- main
do -- environment init
	wrapperEnv["USING_JALON_LOADER"] = true
	wrapperEnv["import"] = import
	wrapperEnv["fetchFile"] = fetchFile
	--wrapperEnv["loadAsset"] = loadAsset
	wrapperEnv["DEV_MODE"] = DEV_MODE
end

return import("src/main.lua")(...)
