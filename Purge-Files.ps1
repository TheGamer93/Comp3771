If ($args.count -lt 2)
{
    Write-Host "This Script needs 2 arguments:"
    Write-Host " - the folder to be purged"
    Write-Host " - The max file age (in days)"
    exit 1
}

$FolderName = $args[0]
$MaxAge = $args[1] -as [int]
if ( $MaxAge -eq $null )
{
    Write-Host "`"$($args[1])`" is not a valid" `
    " number - it should be the maxium file"`
    " age in days"
    Exit 1 
}

If (-not (Test-Path $FolderName -PathType Container))
{
    Write-Host "folder '$FolderName' not found!"
    exit 1
}

Get-ChildItem $FolderName |
Where-Object {($_ -is [IO.Fileinfo])-and
    ($_.LastWriteTime -gt (get-date).AddDays(-$MaxAge))} | 
    Remove-Item -whatif
