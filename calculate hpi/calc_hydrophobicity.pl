#Read fasta file
$fasta_file = $ARGV[0];

#Reading the fasta file
open(READFASTA, "$fasta_file");
@fasta_content = <READFASTA>;

#identify the number of lines in fasta file
$lines = $#fasta_content;

@chop_sequence = @fasta_content[1..$lines];

##print "\n there are $lines lines in $fasta_file fasta file\n";
##print "Sequence part of given file is:\n @chop_sequence\n";

#Transforming array into scaler and remiving any white character
$chop_seq = "@chop_sequence";
$chop_seq =~ s/\s//g;
$seq_lenght = length($chop_seq);

##print "Sequence part of given file is:\n $chop_seq\n And the length of the sequence is:\n$seq_lenght\n";

#Identifying the patch
$i=0; 
	while($i<=$seq_lenght)
	{
	#set window size
	$j = 7; #Window size of 7 letters
	$check = $seq_lenght-$j;
	#if ($i le $check) {
	$patch = substr($chop_seq,$i,$j);
	#}

	$formula = '$'.substr($patch,0,1).'+'.'$'.substr($patch,1,1).'+'.'$'.substr($patch,2,1).'+'.'$'.substr($patch,3,1).'+'.'$'.substr($patch,4,1).'+'.'$'.substr($patch,5,1).'+'.'$'.substr($patch,6,1);
	
	$tmp = 'tmp.pl';
	open (WRITETMP, ">$tmp");
	print WRITETMP '$I= 4.5; #Isoleucine 
$V= 4.2; #Valine 
$L= 3.8; #Leucine
$F= 2.8; #Phenylalanine 
$C= 2.5; #Cysteine 
$M= 1.9; #Methionine
$A= 1.8;  #Alanine
$G= -0.4; #Glycine
$T= -0.7; #Threonine
$W= -0.9; #Tryptophan
$S= -0.8; #Serine
$Y= -1.3; #Tyrosine
$P= -1.6; #Proline
$H= -3.2; #Histidine
$E= -3.5; #Glutamic acid
$Q= -3.5; #Glutamine
$D= -3.5; #Aspartic acid
$N= -3.5; #Aspargine
$K= -3.9; #Lysine
$R= -4.5; #arginnine
$score_sum = (',$formula,');',"\n",'$score_avrg = $score_sum/',$j,';',"\n",'print $score_avrg;';	
  print "$patch ";
	system ("perl $tmp");
	print "\n";
$i = $i + 1;
  }

