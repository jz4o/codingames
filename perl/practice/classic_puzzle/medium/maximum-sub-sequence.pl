use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $n = <STDIN>);
chomp($tokens=<STDIN>);
my @inputs = split(/ /,$tokens);
for my $l (@inputs) {

}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @lists;
foreach my $i (@inputs) {
    foreach my $list_index (0..$#lists) {
        my @list = @{$lists[$list_index]};

        my $last = $list[$#list];
        if (scalar(@list) > 0 && $last == $i - 1) {
            push @{$lists[$list_index]}, $i;
        }
    }

    my @new_list = ($i);
    push @lists, \@new_list;
}

my $max_size = 0;
my @result;
foreach my $scalar_list (@lists) {
    my @list = @{$scalar_list};

    if (scalar(@list) >= $max_size) {
        $max_size = scalar @list;
        @result = @list;
    }
}

# print "1 2 3 4 5\n";
print join ' ', @result;

