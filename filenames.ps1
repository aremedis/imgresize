
#Where do you want to place the outputfile?  
$txtfile = "<ChangeMe>\files.csv";

#Change this variable to the parent directory which you want to retrieve the list of files.
#example:
# "C:\Scripts"
#
$parent= "<CHANGEME>"

$directories = gci $parent | Sort-Object Name;

cd $parent

foreach ($dira in $directories)
{
    $filenames = gci $dira;
    foreach ($file in $filenames)
    {
        add-content -path $txtfile -value "$dira,$file";
    }

}
