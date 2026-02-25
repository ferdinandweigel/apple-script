tell application "Notes"
	-- Access the top-level folder X and the subfolders Posts (Done) and Posts (Published)
	set sourceFolder to folder "Posts (Done)" of folder "X" of account "iCloud"
	set targetFolder to folder "Posts (Published)" of folder "X" of account "iCloud"
	
	-- Get the notes in the source folder
	set folderNotes to notes of sourceFolder
	
	-- Check if there are any notes in the source folder
	if (count of folderNotes) > 0 then
		set selectedNote to item 1 of folderNotes
		set noteContent to body of selectedNote
		
		-- Move the selected note to the target folder
		move selectedNote to targetFolder
	else
		set noteContent to "No notes found in 'Posts (Done)'."
	end if
end tell

-- Return HTML content of the selected note
return noteContent
