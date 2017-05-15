#This script is intended to take as many fasta.txt files as input and merge them all into one file. This will allow user to import all the sequences load into CLustalX

#Delete any preexisting output file, if any is present
system("rm combined.fasta.txt");

#Reading the name of fasta files
@ifile=<*.fasta.txt>;


#Creating a combined fasta.txt file, which will contain all fasta files
$ofile='combined.fasta.txt';
open(APPENDFASTA, ">>$ofile");

#Write all fasta files to one files
foreach(@ifile)
{
open(READFILE, "$_");
@fastalist = <READFILE>;

print APPENDFASTA "@fastalist \n";
print " \n A combined fasta file, named $ofile has been created \n";
}


