use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $intext = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $result = lc $intext;
$result =~ s/,/, /g;
$result =~ s/\s+/ /g;

my @sentences = split /\./, "$result";

my @formatted_sentences;
foreach my $sentence (@sentences) {
    $sentence =~ s/^\s*(.*?)\s*$/$1/;
    if (length $sentence == 0) {
        next;
    }

    push @formatted_sentences, ucfirst($sentence);
}
$result = join('. ', @formatted_sentences);

$result =~ s/\s,/,/g;
$result =~ s/,+/,/g;
if ($intext =~ /\.$/) {
    $result .= '.';
}

# print "solution\n";
print "$result\n";

