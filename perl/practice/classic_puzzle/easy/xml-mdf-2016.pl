use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $sequence = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my %depths = ();
my $depth = 0;
my @sequence_chars = split //, $sequence;
while (@sequence_chars) {
    my $char = shift @sequence_chars;

    if ($char eq '-') {
        my $close_char = shift @sequence_chars;

        if (! exists $depths{$close_char}) {
            push @{$depths{$close_char}}, ();
        }
        push @{$depths{$close_char}}, $depth;

        $depth--;
    } else {
        $depth++;
    }
}

my $maximum_value_key = '';
my $maximum_value = 0;
foreach my $key (keys(%depths)) {
    my $sum = 0;
    foreach my $v (@{$depths{$key}}) {
        $sum += 1 / $v;
    }

    if ($maximum_value < $sum) {
        $maximum_value_key = $key;
        $maximum_value = $sum;
    }
}

# print "answer\n";
print "$maximum_value_key\n";

