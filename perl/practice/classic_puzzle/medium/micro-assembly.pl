use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp($tokens=<STDIN>);
my ($a, $b, $c, $d) = split(/ /,$tokens);
chomp(my $n = <STDIN>);
my @instructions;
for my $i (0..$n-1) {
    chomp(my $instruction = <STDIN>);

    push @instructions, $instruction;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my %values = (
    'a' => $a,
    'b' => $b,
    'c' => $c,
    'd' => $d
);

for (my $i = 0; $i < $n; $i++) {
    my ($operator, $arg1, $arg2, $arg3) = split ' ', $instructions[$i];
    $arg2 = $values{$arg2} if $arg2 =~ m/[a-d]/;
    $arg3 = $values{$arg3} if defined $arg3 && $arg3 =~ m/[a-d]/;

    if ($operator eq 'MOV') {
        $values{$arg1} = $arg2;
    } elsif ($operator eq 'ADD') {
        $values{$arg1} = $arg2 + $arg3;
    } elsif ($operator eq 'SUB') {
        $values{$arg1} = $arg2 - $arg3;
    } elsif ($operator eq 'JNE') {
        # minus 1 is for `for` increment
        $i = $arg1 - 1 if $arg2 != $arg3;
    }
}

# print "a b c d\n";
print "$values{'a'} $values{'b'} $values{'c'} $values{'d'}";

