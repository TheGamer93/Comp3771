# ------------------------------------------------------------------------
#
#   Make-Backup.ps1  -  Make a backup copy of the given file
#
#       This script accepts one or more file name parameters
#       and creates backup copies of each file with a date-suffix
#       and a ".bak" file type.
#
# ------------------------------------------------------------------------

# Verify that an argument was given and that the named files exist:
# ----------------------------------------------------------------
    if ( $args.count -lt 1 )
    {
        write-host "This script requires 1 or more file names to be backed up"
        exit 1
    }

    foreach ( $arg in $args )
    {
        if ( -not (test-path $arg -pathtype leaf) )
        {
            write-host "File not found - $arg"
            write-host "No files have been backed up."
            exit 1
        }
    }


# Go through each file name and make a backup of it:
# -------------------------------------------------
    foreach ( $FileName in $args )
    {

    # Get an object that represents the file and use it to get the file date:
    # ----------------------------------------------------------------------
        $File = Get-Item $FileName
        $FileDate = ($File.LastWriteTime).ToString("yyyy-MM-dd")
    
    # Break up the file name and assemble it with the date suffix and ".bak" file type:
    # --------------------------------------------------------------------------------
        $FileBaseName =
            [IO.Path]::GetFileNameWithoutExtension( $FileName )
        $NewFileName = 
            $FileBaseName + "_" + $FileDate + ".bak"
        
    # Copy the file using "-force" to overwrite any existing backup that may already exist:
    # ------------------------------------------------------------------------------------
        write-host "Copying $FileName to $NewFileName"
        Copy-Item $FileName $NewFileName -force   # use force to overwrite any previous copy
    }