Write-host "saving files in ""backup"" directory"

$BUCount = 0
$BUsize = 0

Get-childitem | Where-object {
    $_.lastwritetime -ge "2010-01-01"} |
    foreach-object{
        Write-host "   "$_.BaseNae
        $BUsize += $_.Length
        $BUCount++

        $Filename = [io.path]::GetFileNameWithoutExtension($_.Name)
        $FileType = [io.path]::GetExtension($_.Name)
        $NewFileName = "backup\$FileName" + "_" +$_.lastwritetime.Tostring("yyyy-mm-dd") + $FileType



        Copy-Item $_ $NewFileName
    }
Write-Host "Saved:" $BUCount "files," $BUsize.Tostring("NO") "bytes"