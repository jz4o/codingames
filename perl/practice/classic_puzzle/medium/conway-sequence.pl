use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $r = <STDIN>);
chomp(my $l = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @result = ($r);
foreach my $i (1..($l-1)) {
    my @temp = @result;
    @result = ();

    while (@temp) {
        my $first_element = $temp[0];
        my ($another_element) = grep { $_ != $first_element } @temp;
        my $delete_size;
        if (defined $another_element) {
            ($delete_size) = grep { $temp[$_] eq $another_element } 0..$#temp;
        } else {
            $delete_size = scalar(@temp);
        }

        push @result, ($delete_size, $first_element);
        @temp = @temp[$delete_size..($#temp)]
    }
}

# print "answer\n";
print join(' ', @result);

