use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'max', 'min';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $r = <STDIN>);
chomp(my $v = <STDIN>);
my @vaults;
for my $i (0..$v-1) {
    chomp($tokens=<STDIN>);
    my ($c, $n) = split(/ /,$tokens);

    push @vaults, Vault->new($c, $n);
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @robbers = map { 0 } (1..$r);

foreach my $v (@vaults) {
    my $vault_time = (10 ** $v->{n}) * (5 ** ($v->{c} - $v->{n}));

    my $min_vault_time = min(@robbers);
    my ($min_vault_index) = grep { $robbers[$_] == $min_vault_time } 0..$#robbers;

    $robbers[$min_vault_index] += $vault_time;
}

# print "1\n";
print max(@robbers);

package Vault {
    use strict;
    use warnings;

    sub new {
        my ($class, $c, $n) = @_;

        my $self = {};
        $self->{c} = $c;
        $self->{n} = $n;

        return $self;
    }
}

