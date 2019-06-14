$Lenpos = 22 # Start Position of Length
$Datepos = 38 # Start Position of date
$LenLength = $Datepos - $Lenpos
Get-Content .\Fileinfo.txt |
ForEach-Object {
    $Name = $_.Substring(0, $Lenpos).Trim()
    $len = $_.Substring($Lenpos, $LenLength).Trim()
    $Date = $_.Substring($Datepos).Trim()
    Write-Host `
    "Name='$Name' Len='$Len' Date='$Date'"
}
