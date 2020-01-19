$x = type .\done
$f = ".\data"
if($x -ne 'Running'){
'Running' | Out-file -NoNewline -Encoding UTF8 -FilePath .\done

.\speedtest.exe | Out-file -Encoding UTF8 -FilePath .\speedtest

type .\speedtest | Select-String "Latency.+" -AllMatches | % { $_.Matches } | % { $_.Value } > .temp
type .\.temp | Select-String -Pattern '[0-9]+\.[0-9]+\ +ms\ +\(' -AllMatches | % { $_.Matches } | % { $_.Value } > .temp2
'Latency' | Out-file -Encoding UTF8 -FilePath $f
type .\.temp2 | Select-String -Pattern '[0-9]+\.[0-9]+' -AllMatches | % { $_.Matches } | % { $_.Value } | Out-file -Encoding UTF8 -Append -FilePath $f


type .\speedtest | Select-String "Download.+" -AllMatches | % { $_.Matches } | % { $_.Value } > .temp
type .\.temp | Select-String -Pattern '[0-9]+\.[0-9]+\ +Mbps\ +\(' -AllMatches | % { $_.Matches } | % { $_.Value } > .temp2
'Download' | Out-file -Encoding UTF8 -Append -FilePath $f
type .\.temp2 | Select-String -Pattern '[0-9]+\.[0-9]+' -AllMatches | % { $_.Matches } | % { $_.Value } | Out-file -Encoding UTF8 -Append -FilePath $f


type .\speedtest | Select-String "Upload.+" -AllMatches | % { $_.Matches } | % { $_.Value } > .temp
type .\.temp | Select-String -Pattern '[0-9]+\.[0-9]+\ +Mbps\ +\(' -AllMatches | % { $_.Matches } | % { $_.Value } > .temp2
'Upload' | Out-file -Encoding UTF8 -Append -FilePath $f
type .\.temp2 | Select-String -Pattern '[0-9]+\.[0-9]+' -AllMatches | % { $_.Matches } | % { $_.Value } | Out-file -Encoding UTF8 -Append -FilePath $f

del .\.temp
del .\.temp2

' ' | Out-file -NoNewline -Encoding UTF8 -FilePath  .\done
}