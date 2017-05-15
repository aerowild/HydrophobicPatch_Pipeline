#@align = <*_out.txt>; #read alignment files
@hpi = <*.patch.txt>; #Read hydrophobic patches

#Foreach hydrobhobic file
foreach $hpi (@hpi)
{
#Read it
open(READHPI, "$hpi");
@hpi_file = <READHPI>;

#Identify its corresponding alignment file
$filename = substr($hpi,0,-10);
$align_name = $filename.'_out.txt';

#Open alignment file
open(READALIGN, "$align_name");
@align_file = <READALIGN>;

#Create new folder tosave the output
mkdir 'merged_output';

#Write merged files to output folder
$merged_file = $filename.'_merged.txt';
$merged_loc = "merged_output/$merged_file";
open(WRITEMERGED, ">$merged_loc");

#Do the main stuff here
foreach $patch (@hpi_file)
  {
  #Get the patch name
  $patch_name = substr($patch,0,7); $patch_name =~ s/\s//g;
  
  
  #Search its alignment scorein align file
  @alignment_line = grep(/$patch_name/, @align_file); 
  $alignment_line = "@alignment_line"; $alignment_line =~ s/\s//g;
  
  #Get alignment score
  $align_score = substr($alignment_line, 8);
  
  chomp $patch;
  print WRITEMERGED "$patch $align_score \n";
  }

}