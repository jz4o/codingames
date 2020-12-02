use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n_1 = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $DIGITS_SIZE = length $n_1;
my @answers;

my $temp = "$n_1";
while (! grep { $_ eq $temp } @answers) {
    push @answers, $temp;

    my $biggest = join('', sort { $b <=> $a } split //, $temp);
    my $smallest = join('', sort { $a <=> $b } split //, $temp);
    my $answer = $biggest - $smallest;

    $temp = sprintf "%0${DIGITS_SIZE}d", $answer;
}

my ($begin_index) = grep { $answers[$_] eq $temp } 0..$#answers;
my @result = @answers[$begin_index..$#answers];

# print "1 2 3 4\n";
print "@result";

