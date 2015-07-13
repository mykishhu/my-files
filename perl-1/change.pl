#!/usr/bin/perl
use warnings;
open(ARR,'jarfiles');
open(FILE,'index.html');
open(OUT,">index1.html");
select OUT;
my @jars=<ARR>;
my $fout;
my $line;
my $i=0;
my $FLAG=0;
foreach $line (<FILE>)
{
	if ( $line=~/java/ )
	{
		$line=~s/build_failed/build_passed/g;
		print "$line";
		$FLAG=1;
	}
	 elsif( $FLAG==1 && $line=~/FAILED/)
	{
		$line=~s/FAILED/OK/g if ( $FLAG==1 );
		print $line;
		$FLAG=0;
	}
	else
	{
		print $line;
	}
}
close(ARR);
close(FILE);
close(OUT);
