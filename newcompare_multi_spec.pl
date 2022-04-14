
#!/usr/bin/perl
#Author: Alka Potdar

use strict;
use warnings;

my @bos_data;
my @human_data;
my @macaca_data;
my @mouse_data;
my @rat_data;

my %seen;
my @comm;
my @diff;
my $item;


###FIND COMMON GENES AMONG THE Human,rat,bos,macaca, MOUSE utr DB##
###read data from a file containing mouse gene symbols into an array
open(DATA1, "mouse_gene") || 
die "Couldnt read from file: $!";
while (<DATA1>) {
chomp; push(@mouse_data, $_);
}


#read data from a file containing human gene symbols into an array
open(DATA2, "homo_gene") || 
 die "Couldnt read from file: $!";
while (<DATA2>) {
chomp; push(@human_data, $_);
}


#read data from a file containing human gene symbols into an array
open(DATA3, "rat_gene") || 
 die "Couldnt read from file: $!";
while (<DATA3>) {
chomp; push(@rat_data, $_);
}

#read data from a file containing human gene symbols into an array
open(DATA4, "bos_gene") || 
 die "Couldnt read from file: $!";
while (<DATA4>) {
chomp; push(@bos_data, $_);
}

#read data from a file containing human gene symbols into an array
open(DATA5, "macaca_gene") || 
 die "Couldnt read from file: $!";
while (<DATA5>) {
chomp; push(@macaca_data, $_);
}

# output File "common" will have the common genes#
open(OUT1,">common");

# output File "diff" will have the unique genes to each database
open(OUT2,">diff");
   


%seen=();
foreach $item (@mouse_data,@human_data,@rat_data,@bos_data,@macaca_data) { $seen{$item}++;}
	foreach $item (keys %seen) {
    		if ($seen{$item} == 5) {
		#	print $item;
        		push @comm, $item;
    		} else {
            		push @diff, $item;
   	        }		
        }

foreach (@comm) {
	print OUT1 "$_\n";
}

foreach (@diff) {
        print OUT2 "$_\n";
}



#





