#This is to identify to identify the hydrophobic patches greater #than one

@read_scorefile = <*score.txt>;

foreach(@read_scorefile)
{
#read file contaning patch information
$score_file = $_;
open(READFILE, "$score_file");
@patches = <READFILE>;

#Write a file contaning desired patches (Names only)
$writefile_name = substr($score_file,0,-10);
$outfile = $writefile_name.'.patch';
open(WRITEFILE, ">$outfile");

#Write a file contaning desired patches (Names and scores)
$writefile_name = substr($score_file,0,-10);
$outfile = $writefile_name.'_top_patch.txt';
open(WRITEFILE2, ">$outfile");

#Define array to hold the values
@hold_patches = ();
@hold_scores = ();

#Get the patches
foreach(@patches)
{
$patch_line = $_;
$patch_line =~ s/\s//g;
@patch_name = substr($patch_line,0,7);
$patch_score = substr($patch_line,7,5);
#$patch_score = float $patch_score;
# print $patch_name,':', "$patch_score\n";

	if ($patch_score > 1)
		{
		push(@hold_patches, "$patch_name");
		$top_patch = "@patch_name".'*'.$patch_score;
		$top_patch =~ s/[*]/ /g;
		push(@hold_scores, "$top_patch");
		}
}

#Because last line should have no new line character, we have to #process the file. Covert array to scalar and process

$hold_patches = "@hold_patches"; $hold_patches =~ s/\s/\n/g; chomp $hold_patches;
$hold_scores = "@hold_scores"; $hold_scores =~ s/\s/\n/g;  chomp $hold_scores;

#Write to files
print WRITEFILE $hold_patches;
print WRITEFILE2 $hold_scores;	


#Empty the array
@hold_patches = ();
@hold_scores = ();
}

system ("perl input_correction.pl");
