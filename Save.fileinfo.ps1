$longest = ($files | ForEach { $_.Name } |
sort Length | select -last 1).Length
$files = Get-ChildItem -File
$formatstr = "{0,-$longest} {1,10:N0}     " +
"{2:yyyy-MM-dd HH:mm:ss.fffffff}"
$files | foreach {
    Write-Output ( $formatstr -f 
    $_.Name, $_.Length, $_.LastWriteTime)
} | Set-Content Fileinfo.txt
