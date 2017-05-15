#This is to correct the formating of input file (space vs new line problem)
mkdir 'top_patches';
@i_file = <*patch.txt>;
foreach(@i_file)
{
open(READFILE, "$_");
@readfile = <READFILE>;

$filename = substr($_,0,-14);
$ofilename = $filename.'.patch.txt';
$ofiles = "top_patches/$ofilename";
open(WRITEFILE,">$ofiles");

$counter1 = 0;
$counter2 = 1;

@hold_array = ();

foreach $line (@readfile)
{
$first = substr($readfile[$counter1],0,7); $first =~ s/\s//g;
$second = substr($readfile[$counter2],0,5); $second =~ s/\s//g;
$merged_line = $first." ".$second."\n";
$counter1 = $counter1 + 2;
$counter2 = $counter2 + 2;
push(@hold_array, $merged_line);
}

$array_length = @hold_array;
#print "array length $array_length \n ";
$x = $array_length - 4;
$max = $array_length - $x; 
@finale_array = @hold_array[0..$max];
print WRITEFILE @finale_array;
}
