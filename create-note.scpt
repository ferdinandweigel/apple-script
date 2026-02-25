on run {input, parameters}
	tell application "Notes"
		-- Get the folder inside the iCloud account
		set targetFolder to folder "Posts (Ideas)" of folder "X" of account "iCloud"
		
		-- Create a new note in that folder
		make new note at targetFolder with properties {body:input}
	end tell
	
	return input
end run
