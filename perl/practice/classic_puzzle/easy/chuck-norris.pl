use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $message = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $binaries = '';
foreach my $char (split '', $message) {
    $binaries .= sprintf("%07d", sprintf("%b", ord($char)));
}

my @grouped_binaries;
while (length $binaries > 0) {
    my $first_binary = substr $binaries , 0, 1;
    $binaries =~ s/^$first_binary+//p;

    push @grouped_binaries, ${^MATCH};
}

my @results;
foreach my $grouped_binary (@grouped_binaries) {
    push @results, '0' x (2 - substr($grouped_binary, 0, 1));
    push @results, '0' x length($grouped_binary);
}

# print "answer\n";
print join ' ', @results;

