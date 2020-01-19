function ReadFile()
	local contents = {}
	FileP = SKIN:MakePathAbsolute('@Resources\\data')
	local File = io.open(FileP, 'r')
	for Line in File:lines() do
		if Line ~= '' then
			table.insert(contents, Line)
		end
	end
	File:close()
	return contents
end

function Update()
	local MyVar = ReadFile()
	SKIN:Bang('!SetVariable', 'latency', MyVar[2])
	SKIN:Bang('!SetVariable', 'download', MyVar[4])
	SKIN:Bang('!SetVariable', 'upload', MyVar[6])
end