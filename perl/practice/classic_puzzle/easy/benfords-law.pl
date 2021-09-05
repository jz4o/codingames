use strict;
use warnings;
#use diagnostics;
use 5.32.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @transactions = ();
for my $i (0..$n-1) {
    chomp(my $transaction = <STDIN>);

    push @transactions, $transaction;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @benford_law_percentages = (0, 0.301, 0.176, 0.125, 0.097, 0.079, 0.067, 0.058, 0.051, 0.046);
my @first_numbers = map { $_ =~ /[1-9]/p; ${^MATCH} } @transactions;

my $is_fraudulent = 0;
foreach my $i (1..9) {
    my $benford_law_percentage = $benford_law_percentages[$i];
    my $first_number_count = grep { $_ == $i } @first_numbers;
    my $percent = $first_number_count / $n;

    if (!(($benford_law_percentage - 0.1) <= $percent && $percent <= ($benford_law_percentage + 0.1))) {
        $is_fraudulent = 1;
        last;
    }
}

# print "false\n";
print $is_fraudulent == 1 ? 'true' : 'false';
