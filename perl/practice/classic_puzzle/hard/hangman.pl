use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $word = <STDIN>);
chomp(my $chars = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $BEAM = '+--+';
my $NO_HEAD = '|';
my $HEAD = '|  o';
my $NO_BODY = '|';
my $BODY = '|  |';
my $ONE_ARM = '| /|';
my $BOTH_ARM = '| /|\\';
my $NO_LEG = '|\\';
my $ONE_LEG = '|\\/';
my $BOTH_LEG = '|\\/ \\';
my @HANGMAN_STATUS_0 = ($BEAM, $NO_HEAD, $NO_BODY,  $NO_LEG);
my @HANGMAN_STATUS_1 = ($BEAM, $HEAD,    $NO_BODY,  $NO_LEG);
my @HANGMAN_STATUS_2 = ($BEAM, $HEAD,    $BODY,     $NO_LEG);
my @HANGMAN_STATUS_3 = ($BEAM, $HEAD,    $ONE_ARM,  $NO_LEG);
my @HANGMAN_STATUS_4 = ($BEAM, $HEAD,    $BOTH_ARM, $NO_LEG);
my @HANGMAN_STATUS_5 = ($BEAM, $HEAD,    $BOTH_ARM, $ONE_LEG);
my @HANGMAN_STATUS_6 = ($BEAM, $HEAD,    $BOTH_ARM, $BOTH_LEG);
my @HANGMAN_STATUS = (
    \@HANGMAN_STATUS_0,
    \@HANGMAN_STATUS_1,
    \@HANGMAN_STATUS_2,
    \@HANGMAN_STATUS_3,
    \@HANGMAN_STATUS_4,
    \@HANGMAN_STATUS_5,
    \@HANGMAN_STATUS_6,
);

# answer to guess
my $result = '';
foreach my $char (split '', $word) {
    $result .= index($chars, lc $char) >= 0 ? $char : '_';
}

# counting errors of guess
my $lower_word = lc $word;
my $errors = 0;
foreach my $char (split ' ', $chars) {
    if (index($lower_word, $char) >= 0) {
        $lower_word =~ s/$char//g;
    } else {
        $errors++;
    }
}

# print "answer\n";
foreach my $hangman_row (@{$HANGMAN_STATUS[$errors]}) {
    print "$hangman_row\n";
}
print "$result";

