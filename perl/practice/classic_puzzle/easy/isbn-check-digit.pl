use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @isbns;
for my $i (0..$n-1) {
    chomp(my $isbn = <STDIN>);

    push @isbns, $isbn;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my %MODULUS_WEIGHTS = ();
push @{$MODULUS_WEIGHTS{10}}, (1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1,3);
push @{$MODULUS_WEIGHTS{11}}, (10, 9, 8, 7, 6, 5, 4, 3, 2, 1);

my @invalids;
foreach my $isbn (@isbns) {
    if ($isbn !~ /^\d+X?$/) {
        push @invalids, $isbn;
        next;
    }

    my $modulus;
    if (length $isbn == 10) {
        $modulus = 11;
    } elsif (length $isbn == 13) {
        if ($isbn =~ /X$/) {
            push @invalids, $isbn;
            next;
        }

        $modulus = 10;
    } else {
        push @invalids, $isbn;
        next;
    }

    my @data_digits = split //, $isbn;
    my $check_digit = pop @data_digits;
    if ($check_digit eq 'X') {
        $check_digit = 10;
    }

    my $sum = 0;
    while (my ($index, $digit) = each (@data_digits)) {
        $sum += $digit * @{$MODULUS_WEIGHTS{$modulus}}[$index];
    }

    my $check_sum = ($modulus - ($sum % $modulus)) % $modulus;
    if ($check_sum != $check_digit) {
        push @invalids, $isbn;
    }
}

my $invalid_size = @invalids;

# print "answer\n";
print "$invalid_size invalid:\n";
foreach my $invalid (@invalids) {
    print "$invalid\n";
}

