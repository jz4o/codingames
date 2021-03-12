use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use DateTime;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $begin = <STDIN>);
chomp(my $end = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my ($begin_day, $begin_month, $begin_year) = split quotemeta('.'), $begin;
my ($end_day, $end_month, $end_year) = split quotemeta('.'), $end;

my $begin_date = DateTime->new(year => $begin_year, month => $begin_month, day => $begin_day);
my $end_date = DateTime->new(year => $end_year, month => $end_month, day => $end_day);

my $duration = $end_date - $begin_date;
my $year = $duration->years;
my $month = $duration->months;
my $days = $end_date->delta_days($begin_date)->delta_days;

my $formatted_year = '';
if ($year == 1) {
    $formatted_year = '1 year';
} elsif ($year > 1) {
    $formatted_year = "$year years";
}

my $formatted_month = '';
if ($month == 1) {
    $formatted_month = '1 month';
} elsif ($month > 1) {
    $formatted_month = "$month months";
}

my $formatted_days = "total $days days";

my $result = join ', ', grep { $_ ne '' } ($formatted_year, $formatted_month, $formatted_days);

# print "YY year[s], MM month[s], total NN days\n";
print $result;

