del .\.temp
del .\.temp2
' ' | Out-file -NoNewline -Encoding UTF8 -FilePath .\speedtest
'0' | Out-file -Encoding UTF8 -FilePath .\data
1..6 | % { '0' | Out-file -Encoding UTF8 -Append -FilePath .\data }
' ' | Out-file -NoNewline -Encoding UTF8 -FilePath .\done