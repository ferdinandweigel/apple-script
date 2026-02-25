on run {input}
	
	-- input is flattened: {"Title 1", "Title 2", ..., "Body 1", "Body 2", ...}
	
	set numSlides to 5
	set slideTitles to {}
	set slideBodies to {}
	
	-- first 5 items are titles
	repeat with i from 1 to numSlides
		set end of slideTitles to item i of input
	end repeat
	
	-- next 5 items are bodies
	repeat with i from (numSlides + 1) to (numSlides * 2)
		set end of slideBodies to item i of input
	end repeat
	
	
	tell application "Keynote"
		activate
		
		-- Create a new Keynote document with a specific theme
		set newDoc to make new document with properties {document theme:theme "LinkedIn Carousel"}
		delay 1
		
		tell newDoc
			-- Set first slide text
			set object text of default title item of slide 1 to item 1 of slideTitles
			set object text of default body item of slide 1 to item 1 of slideBodies
			
			-- Create additional slides
			repeat with i from 2 to (count of slideBodies)
				set newSlide to make new slide
				set object text of default title item of newSlide to item i of slideTitles
				set object text of default body item of newSlide to item i of slideBodies
			end repeat
			
			
			
		end tell
	end tell
	
	
end run
