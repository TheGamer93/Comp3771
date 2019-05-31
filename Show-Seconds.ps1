
function Show-Seconds
{
    write-host "It is now" `
        ([int]((Get-Date) - (get-date).Date).TotalSeconds) `
        "seconds past midnight"
}