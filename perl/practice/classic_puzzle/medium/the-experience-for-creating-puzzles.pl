use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $level = <STDIN>);
chomp(my $xp = <STDIN>);
chomp(my $n = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $EXP_OF_PUZZLE = 300;

my %blitz_prog = (
    'level' => $level,
    'exp' => $EXP_OF_PUZZLE * $n,
    'require_level_up_exp' => $xp
);

%blitz_prog = level_up(\%blitz_prog);

# print "answer\n";
print "$blitz_prog{'level'}\n";
print "$blitz_prog{'require_level_up_exp'}\n";

sub level_up {
    my ($scalar_blitz_prog) = @_;
    my %blitz_prog = %{$scalar_blitz_prog};

    # failure level up
    if ($blitz_prog{'exp'} < $blitz_prog{'require_level_up_exp'}) {
        $blitz_prog{'require_level_up_exp'} -= $blitz_prog{'exp'};
        $blitz_prog{'exp'} = 0;

        return %blitz_prog;
    }

    # level up
    $blitz_prog{'exp'} -= $blitz_prog{'require_level_up_exp'};
    $blitz_prog{'level'}++;
    $blitz_prog{'require_level_up_exp'} = get_exp_for_level_up($blitz_prog{'level'});

    # challenge next level up
    return level_up(\%blitz_prog);
}

sub get_exp_for_level_up {
    my ($level) = @_;

    return int($level * sqrt($level) * 10);
}

