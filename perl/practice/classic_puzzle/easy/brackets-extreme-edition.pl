use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $expression = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my %brackets = ('(' => ')', '[' => ']', '{' => '}');

my @bracket_stack;
my $is_collect = 1;

# remove not bracket character
$expression =~ s/[^\(\)\[\]\{\}]//g;

foreach my $bracket (split //, $expression) {
    # left parts of bracket
    if (exists $brackets{$bracket}) {
        push @bracket_stack, $bracket;
        next;
    }

    # right parts of bracket
    my $last_bracket = scalar(@bracket_stack) > 0 ? pop @bracket_stack : '';
    if (!(exists $brackets{$last_bracket}) || $brackets{$last_bracket} ne $bracket) {
        $is_collect = 0;
        last;
    }
}

# print "true/false\n";
print $is_collect == 1 && scalar(@bracket_stack) == 0 ? 'true' : 'false';

