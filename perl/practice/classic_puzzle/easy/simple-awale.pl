use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $op_bowls = <STDIN>);
chomp(my $my_bowls = <STDIN>);
chomp(my $num = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $BOWLS_SIZE = 7;
my $RESERVE_INDEX = $BOWLS_SIZE - 1;
my $PLAYER_SIZE = 2;
my $PLAYER_INDEX_OPP = 0;
my $PLAYER_INDEX_MY = 1;

my @op_bowls_array = split ' ', $op_bowls;
my @my_bowls_array = split ' ', $my_bowls;
my @bowls = (\@op_bowls_array, \@my_bowls_array);

my $seeds = $bowls[$PLAYER_INDEX_MY][$num];
$bowls[$PLAYER_INDEX_MY][$num] = 0;
my $index = $num + 1;
while ($seeds > 0) {
    my $player_index = (int($index / $BOWLS_SIZE) % $PLAYER_SIZE - 1) * -1;
    my $column_index = $index % $BOWLS_SIZE;

    # is enemyStore
    if ($player_index == $PLAYER_INDEX_OPP && $column_index == $RESERVE_INDEX) {
        $index++;
        next;
    }

    $bowls[$player_index][$column_index]++;

    $index++;
    $seeds--;
}

# print "answer\n";
my $last_bowl_opp = pop @{$bowls[$PLAYER_INDEX_OPP]};
my $last_bowl_my = pop @{$bowls[$PLAYER_INDEX_MY]};
print "@{$bowls[$PLAYER_INDEX_OPP]} [$last_bowl_opp]\n";
print "@{$bowls[$PLAYER_INDEX_MY]} [$last_bowl_my]\n";
print 'REPLAY' if $index % $BOWLS_SIZE == 0;

