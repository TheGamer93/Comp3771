$Lenpos = 22 # Start Position of Length
$Datepos = 38 # Start Position of date
$LenLength = $Datepos - $Lenpos
Get-Content .\Fileinfo.txt |
ForEach-Object {
    $Name = $_.Substring(0, $Lenpos).Trim()
    $len = $_.Substring($Lenpos, $LenLength).Trim()
    $Date = $_.Substring($Datepos).Trim()
}
    $File = Get-Item $Name

    If ($file.Length -ne $len)
    { Write-Host "$Name Length has Changed"}
    If ($File.LastWriteTime -ne $date)
    { Write-host "$Name date has changed"}


