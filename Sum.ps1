$Total = 0
ForEach ($arg in $args){
if ( ($arg -as [int]) -eq $Null )
{
    Write-Host $arg "is not a valid number"
    Continue
}

    $Total += [int]$arg

}

Write-Host "The Total Is:" $Total