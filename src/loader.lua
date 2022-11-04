-- variables
local http_request = (syn and syn.request) or (http and http.request) or request or http_request

-- functions
local function wrapFuncGlobal(func, customFenv)
	local fenv, fenvCache = {}, getfenv(0)
	local fenvMT = {}
	function fenvMT:__index(index)
		return customFenv[index] or fenvCache[index]
	end
	function fenvMT:__newindex(index, value)
		if fenvCache[index] then
			fenvCache[index] = value
		else
			customFenv[index] = value
		end
	end
	setmetatable(fenv, fenvMT)
	setfenv(func, fenv)
	return func
end

function import(path, branch)
	branch = (branch or "main")
	local result, cloudSrc

	if (DEV_MODE) then
		result = {Success = true}
	else
		result = http_request({
			Url = string.format("https://raw.githubusercontent.com/jLn0n/executor-gui/%s/%s", branch, path),
			Method = "GET",
			Headers = {
				["Content-Type"] = "text/html; charset=utf-8",
			}
		})
	end

	if result.Success then
		cloudSrc = result.Body
		local sepPath = string.split(path, "/")
		local currentPath = "executor-gui"

		for pathIndex, pathStr in sepPath do
			if pathIndex == #sepPath then
				currentPath ..= "/" .. pathStr
				local origSrc = (if isfile(currentPath) then readfile(currentPath) else nil)

				if (origSrc ~= cloudSrc) and not DEV_MODE then
					writefile(currentPath, cloudSrc)
				end
				cloudSrc = (origSrc or cloudSrc)
			else
				currentPath ..= "/" .. pathStr
				if not isfolder(currentPath) then makefolder(currentPath) end
			end
		end
	else
		return error(string.format("Cannot get '%s' with branch '%s' from the repository.", path, branch))
	end
	return wrapFuncGlobal(loadstring(cloudSrc, "=" .. "executor-gui" .. path), {import = import})
end

-- main
import("src/main.lua")()