#!/usr/bin/perl
$file = "/home/epattki/git-repo/my-files/perl-1/filecsv.csv";

open(FH,"$file") or die"$!\n";
@arr = <FH>;
$first = shift(@arr);
foreach $line(@arr) {

($reportname,$reportdesc,$actfl,$format,$freq,$cabinet,$folder,$appl) 
+= split(',',$line);
#print "$reportname,$reportdesc,$actfl,$format,$freq,$cabinet,$folder,
+$appl\n";
@files = "/home/epattki/git-repo/my-files/perl-1/$reportname.doc";
#print "@files\n";
foreach $doc(@files) {

  open(FH,'>'.$doc) or die"$!\n";
  print FH "\[DOCUMENT\]\n";
  print FH "INPUT=$reportname" ."\n";
  print FH "FORMAT=$format" . "\n";
  print FH "DESCRIPTION=$reportdesc" ."\n";
  print FH "RECDATE=  " ."\n";
  print FH "DELETEINPUT=NO" ."\n";
  print FH "NODE_ID=1" ."\n";
  print FH "VOLUME_ID=1" ."\n";
  print FH "    " ."\n";
   
  print FH "[CBNTFLDR]" ."\n";
  print FH "CABINET=$cabinet" . "\n";
  print FH "FOLDER=$folder" ."\n";
  print FH "   " ."\n";
  print FH "[USER_DEFINITIONS]" ."\n";
  print FH "Freq:Daily Application:$appl" ."\n";
  print FH "      " ."\n";
  }

 close(FH);

$docu="/home/epattki/git-repo/my-files/perl-1/$reportname.doc";
