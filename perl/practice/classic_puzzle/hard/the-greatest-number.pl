use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
chomp(my $input = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @inputs = split ' ', $input;
my ($minus) = grep { $_ eq '-' } @inputs;
my ($dot) = grep { $_ eq '.' } @inputs;
@inputs = grep { $_ !~ m/-|\./ } @inputs;

if ($minus) {
    @inputs = sort { $a <=> $b } @inputs;
    splice @inputs, 1, 0, $dot if $dot;
    unshift @inputs, $minus;
    @inputs = (0) if (join '', @inputs) =~ m/^-0\.0+$/;
} else {
    @inputs = sort { $b <=> $a } @inputs;
    splice @inputs, $#inputs, 0, $dot if $dot;
    @inputs = @inputs[0..$#inputs-2] if (join '', @inputs) =~ m/\.0/
}

# print "greatest\n";
print join '', @inputs;

