use strict;
use warnings;
#use diagnostics;
use 5.32.1;

use POSIX 'floor';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @numbers;
for my $i (0..$n-1) {
    chomp(my $x = <STDIN>);

    push @numbers, $x;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @results = map { how_to_read($_) } @numbers;

# print "cardinal\n";
foreach my $result (@results) {
    print "$result\n";
}

sub how_to_read {
    my ($number) = @_;

    return 'negative ' . how_to_read(substr $number, 1) if substr($number, 0, 1) eq '-';

    if (length($number) >= 4) {
        my @over_thousand_unit_names = ('', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion');

        my $number_size = length($number);
        my $unit_number_size = $number_size % 3 == 0 ? 3 : $number_size % 3;
        my $mod_number_size = $number_size - $unit_number_size;

        my $unit_number = substr $number, 0, $unit_number_size;
        my $mod_number = substr $number, $unit_number_size;

        my $result = '';
        $result .= how_to_read($unit_number) . ' ' . $over_thousand_unit_names[floor($mod_number_size / 3)];
        $result .= ' ' . how_to_read($mod_number) if $mod_number !~ /^0+$/;

        return $result;
    }

    my $result = '';
    if ($number >= 100) {
        my $hundred_unit = floor($number / 100);
        my $mod_unit = $number % 100;

        $result .= how_to_read($hundred_unit) . ' hundred' if $hundred_unit > 0;
        $result .= ' ' . how_to_read($mod_unit) if $mod_unit > 0;
    } elsif ($number >= 20) {
        my @ten_unit_names = ('', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety');
        my $ten_unit = floor($number / 10);
        my $mod_unit = $number % 10;

        $result .= $ten_unit_names[$ten_unit] if $ten_unit > 0;
        $result .= '-' . how_to_read($mod_unit) if $mod_unit > 0;
    } else {
        my @under_twenty_names = (
            'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
            'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
        );

        $result = $under_twenty_names[$number];
    }

    return $result;
}
