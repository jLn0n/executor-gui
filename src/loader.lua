getgenv().repoImport = function(path, branch)
	return loadstring(game:HttpGetAsync(script.format("https://raw.githubusercontent.com/jLn0n/executor-gui/%s/%s", owner, branch or "main", path)), path)
end

repoImport("src/main.lua")()
