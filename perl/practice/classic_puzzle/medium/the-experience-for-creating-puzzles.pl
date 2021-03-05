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

my $blitz_prog = BlitzProg->new(
    'level' => $level,
    'exp' => $EXP_OF_PUZZLE * $n,
    'require_level_up_exp' => $xp
);
$blitz_prog->level_up;

# print "answer\n";
print "$blitz_prog->{'level'}\n";
print "$blitz_prog->{'require_level_up_exp'}\n";

package BlitzProg {
    sub new {
        my ($class, @args) = @_;
        my %args = @args;
        my $self = {%args};

        return bless $self, $class;
    }

    sub level_up {
        my $self = shift;

        # failure level up
        if ($self->{'exp'} < $self->{'require_level_up_exp'}) {
            $self->{'require_level_up_exp'} -= $self->{'exp'};
            $self->{'exp'} = 0;

            return;
        }

        # level up
        $self->{'exp'} -= $self->{'require_level_up_exp'};
        $self->{'level'}++;
        $self->{'require_level_up_exp'} = $self->get_exp_for_level_up;

        # challenge next level up
        $self->level_up;
    }

    sub get_exp_for_level_up {
        my $self = shift;

        return int($self->{'level'} * sqrt($self->{'level'}) * 10);
    }
}

