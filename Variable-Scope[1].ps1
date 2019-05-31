#====================================================================
#   Function-Variable-Scope.ps1
#      This script demonstrates the difference between specifying
#      and not specifying the data type of your parameters.
#====================================================================
function func1
{
    write-host "`nInside func1, `$variable contains `"$variable`""
    $variable = "Func1 value"
    write-host "`nInside func1, `$variable has been set to `"$variable`""
}

# Main routine - script execution starts here
# -------------------------------------------

    $variable = "Main value"
    write-host "`nBefore calling func1, `$variable contains `"$variable`""
    func1
    write-host "`nAfter returning from func1, `$variable contains `"$variable`""


