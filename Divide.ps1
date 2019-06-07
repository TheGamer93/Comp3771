function Divide ( [double]$Dividend, [double]$Divisor )
{
    if ( $Divisor -eq 0 )
    {
        write-output ([double]::PositiveInfinity)
        return
    }
	
    write-output $Dividend / $Divisor
}

write-host -nonewline "Ten divided by zero is: "
Divide 10 0