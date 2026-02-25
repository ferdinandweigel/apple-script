on run {input}
	
	set pdfName to (item 1 of input) & ".pdf"
	
	tell application "Keynote"
		if (count of documents) = 0 then
			return "No Keynote document open."
		end if
		
		set newDoc to the front document
		
		-- Export PDFb
		set desktopPDFPath to ((POSIX path of (path to desktop folder)) & pdfName)
		export newDoc to POSIX file desktopPDFPath as PDF
		
		-- Export slides as PNG (UNCHANGED)
		set exportFolder to (POSIX path of (path to desktop folder)) & "Carousel PNG Slides/"
		do shell script "mkdir -p " & quoted form of exportFolder
		export newDoc to POSIX file exportFolder as slide images with properties {image format:PNG}
	end tell
	
	-- Rename PNG files (UNCHANGED)
	set exportFolder to (POSIX path of (path to desktop folder)) & "Carousel PNG Slides/"
	set fileList to paragraphs of (do shell script "ls -1 " & quoted form of exportFolder & " | grep '.png$'")
	
	set counter to 1
	repeat with f in fileList
		set oldFile to exportFolder & f
		set newFile to exportFolder & "Slide_" & counter & ".png"
		do shell script "mv " & quoted form of oldFile & " " & quoted form of newFile
		set counter to counter + 1
	end repeat
	
	return desktopPDFPath
	
end run
