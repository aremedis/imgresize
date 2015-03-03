#Change this variable to the parent directory which you want to retrieve the list of files.
#example:
# "C:\Scripts"
#
 
$parent= "<PARENT>"
$output= "<OutputLocation>"

#Where do you want to place the outputfile? 
$txtfile = "$output\files.txt";

#uncomment line 13, and 31 if you want a .csv instead
#$csvfile = "$output\files.csv




$directories = (gci -directory -recurse $parent).FullName | Sort-Object Name;

cd $parent

foreach ($dira in $directories)
{
    $filenames = gci  $dira;
    foreach ($file in $filenames)

    {
        $dirb = $dira.Substring($parent.length);
        add-content -path $txtfile -value "$dirb : `t $file";

        #add-content -path $csvfile -value "$dirb,$file";
    }

}
