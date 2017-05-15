@use_fasta = <*.fasta.txt>;
foreach (@use_fasta)
{
$f_name = substr($_,0,-10);
$f_result = $f_name.'_score.txt';
system ("del $f_result");
system ("perl calc_hydrophobicity.pl $_ >> $f_result");
unlink 'tmp.pl';
}