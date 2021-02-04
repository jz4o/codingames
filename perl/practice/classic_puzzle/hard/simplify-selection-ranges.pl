use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

$n =~ s/\[|\]//g;
my @numbers = sort { $a <=> $b } (split ',', $n);

my @result;
my @temp;
while (scalar @numbers > 0) {
    if (scalar @temp == 0 || ($temp[$#temp] + 1) == $numbers[0]) {
        push @temp, shift(@numbers);
    } else {
        push @result, build_add_items(@temp);
        @temp = ();
    }
}

if (scalar @temp > 0) {
    push @result, build_add_items(@temp);
}

# print "answer\n";
print join ',', @result;

sub build_add_items {
    my @array = @_;

    return scalar @array >= 3 ? "$array[0]-$array[$#array]" : join(',', @array);
}

