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
my @piles;
for my $c (@inputs) {
    push @piles, $c;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

@piles = grep { $_ != 0 } @piles;

my $same_configuration_index = 0;
my @configurations;

while (1) {
    @piles = sort { $a <=> $b } @piles;
    push @configurations, (join ' ', @piles);

    my $piles_size = scalar @piles;
    for (my $i = 0; $i < scalar @piles; $i++) {
        $piles[$i] = $piles[$i] - 1;
    }
    @piles = grep { $_ != 0 } @piles;
    push @piles, $piles_size;

    @piles = sort { $a <=> $b } @piles;
    my $configuration = join ' ', @piles;

    if (grep { $_ eq $configuration } @configurations) {
        ($same_configuration_index) = grep { $configurations[$_] eq $configuration } 0..$#configurations;
        last;
    }
}

# print "1\n";
print scalar(@configurations) - $same_configuration_index;

