getgenv().repoImport = function(path, branch)
	return loadstring(game:HttpGetAsync(string.format("https://raw.githubusercontent.com/jLn0n/executor-gui/%s/%s", branch or "main", path)), path)
end

repoImport("src/main.lua")()