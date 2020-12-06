use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $n = <STDIN>); # Number of elements which make up the association table.
chomp(my $q = <STDIN>); # Number Q of file names to be analyzed.
my %ext_mimes;
for my $i (0..$n-1) {
    # ext: file extension
    # mt: MIME type.
    chomp($tokens=<STDIN>);
    my ($ext, $mt) = split(/ /,$tokens);

    $ext_mimes{lc $ext} = $mt;
}
my @fnames;
for my $i (0..$q-1) {
    chomp(my $fname = <STDIN>); # One file name per line.

    push @fnames, lc($fname);
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @mime_types;
foreach my $fname (@fnames) {
    my @fname_elements = split '\.', $fname;
    my $ext = scalar(@fname_elements) == 0 || (substr $fname, -1) eq '.' ? '' : $fname_elements[-1];

    my $mime_type = $ext_mimes{$ext};

    push @mime_types, (($ext eq $fname || !$mime_type) ? 'UNKNOWN' : $mime_type);
}

# For each of the Q filenames, display on a line the corresponding MIME type. If there is no corresponding type, then display UNKNOWN.

# print "UNKNOWN\n";
foreach my $mime_type (@mime_types) {
    print "$mime_type\n";
}

