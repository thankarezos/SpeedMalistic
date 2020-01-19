$x = type .\done.txt
if($x -ne 'Running'){
'Running' | Out-file -NoNewline -Encoding UTF8 -FilePath .\done.txt
.\speedtest.exe | Out-file -Encoding UTF8 -FilePath .\speedtest
type .\speedtest | Select-String "Latency.+" -AllMatches | % { $_.Matches } | % { $_.Value } > .temp
type .\.temp | Select-String -Pattern '[0-9]+\.[0-9]+\ +ms\ +\(' -AllMatches | % { $_.Matches } | % { $_.Value } > .temp2
type .\.temp2 | Select-String -Pattern '[0-9]+\.[0-9]+' -AllMatches | % { $_.Matches } | % { $_.Value } | Out-file -NoNewline -Encoding UTF8 -FilePath .\Latency
type .\speedtest | Select-String "Download.+" -AllMatches | % { $_.Matches } | % { $_.Value } > .temp
type .\.temp | Select-String -Pattern '[0-9]+\.[0-9]+\ +Mbps\ +\(' -AllMatches | % { $_.Matches } | % { $_.Value } > .temp2
type .\.temp2 | Select-String -Pattern '[0-9]+\.[0-9]+' -AllMatches | % { $_.Matches } | % { $_.Value } | Out-file -NoNewline -Encoding UTF8 -FilePath .\Download
type .\speedtest | Select-String "Upload.+" -AllMatches | % { $_.Matches } | % { $_.Value } > .temp
type .\.temp | Select-String -Pattern '[0-9]+\.[0-9]+\ +Mbps\ +\(' -AllMatches | % { $_.Matches } | % { $_.Value } > .temp2
type .\.temp2 | Select-String -Pattern '[0-9]+\.[0-9]+' -AllMatches | % { $_.Matches } | % { $_.Value } | Out-file -NoNewline -Encoding UTF8 -FilePath .\Upload
' ' | Out-file -NoNewline -Encoding UTF8 -FilePath  .\done.txt
}