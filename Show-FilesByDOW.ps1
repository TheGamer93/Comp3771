If ($args.Count -lt 2)
{
    Write-Host "this script needs 2 arguments:"
    Write-Host " - The Folder Name"
    Write-Host " - A day of the week (ex. Monday)"
    Exit 1
}

$FolderName = $args[0]
$DayOftheWeek = $args[1] 
$weekdays = @("Sunday","Monday","Tuesday","Wednesday","thursday","Friday","Saturday");
If ( $weekdays -notcontains $DayOftheWeek )
{
    Write-host "$($args[1]) is not a vaild day of the week - EX.Monday" 
    Exit 1
}

If (-not (Test-path $FolderName -PathType Container))
{
    Write-Host "folder '$Foldername' not found!"
    Exit 1
}

Get-ChildItem $FolderName -File | 
Where-Object {($_.LastWriteTime).DayOfWeek -eq $DayOftheWeek}