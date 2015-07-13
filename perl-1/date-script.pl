#!/usr/bin/perl

my $seq1 = `date +"%m%d%EY"`;
chop($seq1);
my $seq2 = `date +"%H%M%S"`;
chop($seq2);
##my $seq3 = `date +"%M"`;
##chop($seq3);
##my $seq4 = `date +"%S"`;
##chop($seq4);
##my $seq = "$seq1$seq2$seq3$seq4";
##chop($seq)//;
my $seq = "$seq1$seq2";
chop($seq);


print $seq;
