#!/usr/bin/perl
use File::Copy;

my @jars=();
my @bins=();
my @libs=();
my $platform;
sub output
{
my @rel=@_;
my $rele=@rel[0];
my $commdir='/home/develop3/nb/projects/';
my $reldir=$commdir.$rele;
my $option=@rel[1];
print "$option\n";
if ( $option eq "JAVA" )
{
my $builddir=$reldir."/builds/java/";
opendir (DIR1, $builddir) or die $!;
my @ser=sort(grep(!/^(\.|\.\.)$/, readdir(DIR1)));
my $serdir=$builddir."@ser";
my $jardir=$serdir."/out/lib/jar";  
opendir (DIR2, $jardir) or die $!;
@jars=sort(grep(!/^(\.|\.\.)$/, readdir(DIR2)));
#print "@jars\n";
}
elsif ( $option eq "BATCH" )
{
my $builddir=$reldir."/builds/batch/";
opendir (DIR1, $builddir) or die $!;
my @ser=sort(grep(!/^(\.|\.\.)$/, readdir(DIR1)));
my $serdir=$builddir."@ser";
my $bindir=$serdir."/out/bin/";
my $libdir=$serdir."/out/lib/";
opendir (DIR2, $bindir) or die $!;
my @pform=sort(grep(!/^(\.|\.\.)$/, readdir(DIR2)));
my $binplatdir=$bindir."@pform";
my $libplatdir=$libdir."@pform";
$platform="@pform";
opendir (DIR3, $binplatdir) or die $!;
@bins=sort(grep(!/^(\.|\.\.)$/, readdir(DIR3)));
opendir (DIR4, $libplatdir) or die $!;
@libs=sort(grep(!/^(\.|\.\.)$/, readdir(DIR4)));
}
else{print ":in else loop";}
}

sub javawebchange
{
my $flag=0;
my $filecon = "";
	open("FILE","index.html");
	#open("FILE","kfile");
	my @lines=<FILE>;
	close(FILE);
	open("WRITE",">index1.html");
	#select WRITE;
        foreach(@jars)
        {
		#print "$_\n";
	}

foreach my $line (@lines)
{
	chomp($line);
	#print "line b4: #$line#\n";
	if ($line =~ m#<td class="build_file">(.*)</td>#g)
	{
		$jarname1=$1;
		my $jarname="";
		print "Jarname:$jarname1\n";
		if ($jarname1 =~ m/libbat/)
		{
		$jarname=quotemeta $jarname1;	
		}
		else
		{
		$jarname=$jarname1;
		}
		if ( grep { /$jarname/ } @jars )
		 #if ( grep $jar_name eq $jarname, @jars )
		{
		        print "In if loop ....... $jarname\n";	
        		$line=~ s/\b(build_failed)\b/build_passed/g;
        		$line=~ s/build\..*\.log/out\/lib\/jar\/$jarname/g;
        		#print "line after : #$line#\n";
			$filecon .= "$line\n";
			$flag = 1;
		}
        }	
        elsif ( $flag == 1 && $line =~ /FAILED/ )
        {
		$line =~ s/FAILED/OK/g;
                #print "elseif : #$line#\n"; 
		$flag = 0;
		$filecon .= "$line\n";
        }	
	else
	{	
		$filecon .= "$line\n";
		#print "else:#$line#\n";
	}
   	#print  "Filecone : <$filecon>\n";<stdin>;
}

	print WRITE $filecon;
	close(WRITE);
	move("index.html","index.html_ori");
	move("index1.html","index.html");
	  

}
my $batch="BATCH";
my $java="JAVA";
sub main
{
use Switch;
print "Please enter the release name\n";
chomp($rel=<STDIN>);
print "$rel\n";

print "###########################################################\n";
print "Please enter  your choice\n";
print "1. Java\n";
print "2. Batch\n";
print "3. Online\n";
print "4. All\n";
print "\n ";
print "##########################################################\n";

chomp($choi=<STDIN>);

switch ($choi)  
  {

case 1 {output($rel,$java);javawebchange();}

case 2 {output($rel,$batch);}

case 3 {print "onlinewebchange.pl\n";}

case 4 {print "allwebchange.pl\n";}

else   {print "Invalid Option\n";}
  } 
}
main();
