use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::MoreUtils qw(firstidx);
use Time::Piece;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $leap_year = <STDIN>);
chomp($tokens=<STDIN>);
my ($source_day_of_week, $source_month, $source_day_of_month) = split(/ /,$tokens);
chomp($tokens=<STDIN>);
my ($target_month, $target_day_of_month) = split(/ /,$tokens);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @DAY_OF_WEEK = qw(Monday Tuesday Wednesday Thursday Friday Saturday Sunday);

#  year is 2001 if leap is 0
#  year is 2000 if leap is 1
my $year = $leap_year * -1 + 1 + 2000;

my $format = '%Y %b %e';
my $target_date = Time::Piece->strptime("$year $target_month $target_day_of_month", $format);
my $source_date = Time::Piece->strptime("$year $source_month $source_day_of_month", $format);

my $days = ($target_date - $source_date)->days;
my $source_day_of_week_index = firstidx { $_ eq $source_day_of_week } @DAY_OF_WEEK;
my $target_day_of_week_index = ($source_day_of_week_index + $days + (abs($days) * scalar(@DAY_OF_WEEK))) % scalar(@DAY_OF_WEEK);

print $DAY_OF_WEEK[$target_day_of_week_index];

