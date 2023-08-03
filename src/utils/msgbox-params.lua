return {
	-- (Topbar)
	["CloseUI"] = {
		Title = "Close executor",
		TextContent = "Do you really want to close the executor? Don't forget to save any unsaved tabs first.",
		ButtonCount = 2,
	},


	-- (Container - Executor)
	-- (Buttons)
	["ClearCurrentTab"] = {
		Title = "Clear current tab",
		TextContent = "Are you sure you want to clear out the text editor? Any changes will not be saved if you do so.",
		ButtonCount = 2,
	},
	["SaveExistingFile"] = {
		Title = "Save '%s'",
		TextContent = "Are you sure you want to save this tab?",
		ButtonCount = 2,
	},
	["SaveNewFile"] = {
		Title = "Save '%s'",
		TextContent = "Save name:",
		Button0Text = "Save",
	},
	["SaveNewFileFailed"] = {
		Title = "Saving failed",
		TextContent = "Failed to save file called '%s'.",
		ButtonCount = 1,
		Button0Text = "Ok"
	},


	-- (Tabs)
	["CloseCurrentTab"] = {
		Title = "Close tab '%s'",
		TextContent = "Do you really want to close this tab?.",
		ButtonCount = 2,
	},

	-- (Scripts)
	["FileAlreadyExist"] = {
		Title = "Already exist",
		TextContent = "'%s' already exist.",
		ButtonCount = 1,
		Button0Text = "Ok"
	},
	["CreateNewFile"] = {
		Title = "Create new file",
		TextContent = "File name:",
		Button0Text = "Create file",
	},
	["CreateNewFileFailed"] = {
		Title = "Create file failed",
		TextContent = "Failed to create new file called '%s'.",
		ButtonCount = 1,
		Button0Text = "Ok"
	},
	["RenameFile"] = {
		Title = "Rename '%s'",
		TextContent = "File name:",
		Button0Text = "Rename"
	},
	["RenameFileFailed"] = {
		Title = "Rename failed",
		TextContent = "Failed to rename '%s'.",
		ButtonCount = 1,
		Button0Text = "Ok"
	},
	["DeleteFile"] = {
		Title = "Delete '%s'",
		TextContent = "Are you sure you want to delete this file? This process cannot be reversed.",
		ButtonCount = 2,
	},


	-- (Container - Console)
	["ClearOutput"] = {
		Title = "Clear console outputs",
		TextContent = "Do you really want to clear out console outputs?",
		ButtonCount = 2,
	}
}
