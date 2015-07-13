#!/usr/bin/perl

use File::HomeDir qw(home)s;
 use File::Spec::Functions qw(catfile);

 print "The path is ", catfile( home(), 'foo.txt' ), "\n";
