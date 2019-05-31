# Print-TimesTableLine - Prints one line from the times table:
# -----------------------------------------------------------
function Print-TimesTableLine ( [int]$Value1, [int]$Value2 )
{
    $Number = $Value1 * $Value2
    write-host "   $Value1 X $Value2 = $Number"
}

# Print-TimesTable - Print a complete times table for the given $Value
# --------------------------------------------------------------------
#     $Value x 1
#     $Value x 2
#     $Value x 3
#          :
#        up to
#     $Value x $Max

function Print-TimesTable( [int]$Value, [int]$Max )
{
    write-host "`n$Value Times Table:"
    write-host        "-------------"

    for( $Number=0; $Number -le $Max; $Number++ )
    {
        Print-TimesTableLine $Value $Number
    }

    write-host ""
}

# Main Script - Execution starts here:
# -----------------------------------

    for( $Number=1; $Number -le 5; $Number++ )
    {
        Print-TimesTable $Number 5
    }
