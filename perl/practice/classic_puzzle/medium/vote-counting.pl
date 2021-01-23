use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $n = <STDIN>);
chomp(my $m = <STDIN>);
my %voters;
for my $i (0..$n-1) {
    chomp($tokens=<STDIN>);
    my ($person_name, $nb_vote) = split(/ /,$tokens);

    $voters{$person_name} = $nb_vote;
}
my %votes;
for my $i (0..$m-1) {
    chomp($tokens=<STDIN>);
    my ($voter_name, $vote_value) = split(/ /,$tokens);

    if (! exists $votes{$voter_name}) {
        $votes{$voter_name} = ();
    }

    push @{$votes{$voter_name}}, $vote_value;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";


my $yes = 0;
my $no = 0;
while (my ($voter_name, $vote_count) = each %voters) {
    if (! exists $votes{$voter_name}) {
        next;
    }

    my @vote_values = @{$votes{$voter_name}};

    if ($vote_count < scalar @vote_values) {
        next;
    }

    $yes += grep { $_ eq 'Yes' } @vote_values;
    $no += grep { $_ eq 'No' } @vote_values;
}

# print "output\n";
print "$yes $no";

