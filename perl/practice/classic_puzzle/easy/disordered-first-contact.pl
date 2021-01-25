use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'sum', 'min';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
chomp(my $message = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $result = $message;
foreach my $i (0..(abs($n) - 1)) {
    $result = $n > 0 ? decode($result) : encode($result);
}

# print "answer\n";
print "$result";


sub decode {
    my ($text) = @_;

    my $temp_text = $text;
    my $result = '';
    my $turn = 1;

    my $sum = $turn;
    while ($sum < length $temp_text) {
        $turn++;
        $sum += $turn;
    }

    while ($turn > 0) {
        my $slice_size = length($temp_text) - sum(0..($turn - 1));
        my $slice_regexp = $turn % 2 == 1 ? ".{$slice_size}\$" : "^.{$slice_size}";

        $temp_text =~ s/$slice_regexp//p;
        $result = "${^MATCH}$result";

        $turn--;
    }

    return $result;
}

sub encode {
    my ($text) = @_;

    my $temp_text = $text;
    my $result = '';
    my $turn = 1;

    while (length $temp_text != 0) {
        my $slice_size = min($turn, length $temp_text);

        $temp_text =~ s/^.{$slice_size}//p;
        $result = $turn % 2 == 1 ? "$result${^MATCH}" : "${^MATCH}$result";

        $turn++;
    }

    return $result;
}

