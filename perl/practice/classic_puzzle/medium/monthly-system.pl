use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @ms;
for my $i (0..$n-1) {
    chomp(my $m = <STDIN>);

    push @ms, $m;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $sum = 0;
foreach my $m (@ms) {
    $sum += month_base_number_to_integer($m);
}

my $result = integer_to_month_base_number($sum);

# print "answer\n";
print "$result";


sub month_base_number_to_integer {
    my ($month_base_number) = @_;

    my @MONTHS = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

    my $result = 0;

    my @reverse_months = reverse $month_base_number =~ /.{3}/g;

    while (my ($index, $month) = each (@reverse_months)) {
        my ($month_index) = grep { $MONTHS[$_] eq $month } 0..$#MONTHS;
        $result += $month_index * (scalar(@MONTHS) ** $index);
    }

    return $result;
}

sub integer_to_month_base_number {
    my ($num) = @_;

    my @MONTHS = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

    return $MONTHS[$num] if $num == 0;

    my @results;
    while ($num > 0) {
        unshift @results, $MONTHS[$num % scalar(@MONTHS)];
        $num = int($num / scalar(@MONTHS));
    }

    return join '', @results;
}

