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

my $is_carmichael = !is_prime($n);
foreach my $prime_factor (prime_division($n)) {
    if ((($n - 1) % ($prime_factor - 1)) != 0) {
        $is_carmichael = 0;
        last;
    }
}

# print "YES|NO\n";
print $is_carmichael == 1 ? 'YES' : 'NO';

sub prime_division {
    my ($num) = @_;

    my @list;

    my $n = $num;
    while ($n % 2 == 0) {
        push @list, 2;
        $n /= 2;
    }

    my $i = 3;
    while ($n != 1) {
        if ($n % $i == 0) {
            push @list, $i;
            $n /= $i;
        } else {
            $i += 2;
        }
    }

    return @list;
}

sub is_prime {
    my ($num) = @_;

    my $i = 2;
    while ($i < $num) {
        if ($num % $i == 0) {
            return 0;
        }

        $i++;
    }

    return 1;
}

