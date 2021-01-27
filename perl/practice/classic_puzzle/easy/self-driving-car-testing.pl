use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
chomp(my $xthen_commands = <STDIN>);
my @rthen_roadpatterns;
for my $i (0..$n-1) {
    chomp(my $rthen_roadpattern = <STDIN>);

    push @rthen_roadpatterns, $rthen_roadpattern;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my ($position, @commands) = split ';', $xthen_commands;

my @command_chars;
foreach my $command (@commands) {
    my ($amount, $comm) = $command =~ m/\d+|\w/g;

    push @command_chars, split('', $comm x $amount);
}

my @results;
foreach my $rthen_roadpattern (@rthen_roadpatterns) {
    my ($count, $pattern) = split ';', $rthen_roadpattern;

    foreach my $i (0..($count - 1)) {
        my $command = shift @command_chars;

        if ($command eq 'L') {
            $position--;
        } elsif ($command eq 'R') {
            $position++;
        }

        my $result = $pattern;
        substr $result, $position - 1, 1, '#';

        push @results, $result;
    }
}

# print "answer\n";
foreach my $result (@results) {
    print "$result\n";
}

