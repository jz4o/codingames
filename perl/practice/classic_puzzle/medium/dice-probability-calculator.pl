use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $expr = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @incomplete_exprs = ($expr);
my @exprs;

while (@incomplete_exprs) {
    my $incomplete_expr = shift @incomplete_exprs;
    if ($incomplete_expr !~ 'd') {
        push @exprs, $incomplete_expr;
        next;
    }

    $incomplete_expr =~ /d\d/p;
    my $possibly = ${^MATCH};
    my ($front, $back) = split $possibly, $incomplete_expr, 2;

    $possibly =~ s/d//;
    foreach my $i (1..$possibly) {
        push @incomplete_exprs, join '', ($front, $i, $back);
    }
}

my @answers = map { calc($_) } @exprs;

my %uniq_answers;
foreach my $answer (@answers) {
    $uniq_answers{$answer} = 1;
}

# print "answer\n";
foreach my $answer (sort { $a <=> $b } keys %uniq_answers) {
    my $answer_count = grep { $_ == $answer } @answers;

    my $percentage = $answer_count / scalar(@answers) * 100;
    my $formatted_percentage = sprintf '%.2f', $percentage;

    print "$answer $formatted_percentage\n";
}


sub calc {
    my ($expr) = @_;

    # brackets
    while ($expr =~ /\(/) {
        $expr =~ /\([^\()]+?\)/p;
        my $matched = ${^MATCH};

        my $answer = calc(substr $matched, 1, -1);

        my $sanitized_match = quotemeta $matched;
        $expr =~ s/$sanitized_match/$answer/;
    }

    $expr =~ s/([\*\+\->])/ $1 /g;
    my @expr_elements = split /\s+/, $expr;

    my @asterisk_indexes = grep { $expr_elements[$_] eq '*' } 0..$#expr_elements;
    foreach my $index (sort { $b <=> $a } @asterisk_indexes) {
        my $answer = $expr_elements[$index - 1] * $expr_elements[$index + 1];
        splice @expr_elements, $index - 1, 3, ($answer);
    }

    my @plus_indexes = grep { $expr_elements[$_] eq '+' } 0..$#expr_elements;
    foreach my $index (sort { $b <=> $a } @plus_indexes) {
        my $answer = $expr_elements[$index - 1] + $expr_elements[$index + 1];
        splice @expr_elements, $index - 1, 3, ($answer);
    }

    my @minus_indexes = grep { $expr_elements[$_] eq '-' } 0..$#expr_elements;
    foreach my $index (sort { $b <=> $a } @minus_indexes) {
        my $answer = $expr_elements[$index - 1] - $expr_elements[$index + 1];
        splice @expr_elements, $index - 1, 3, ($answer);
    }

    my @gt_indexes = grep { $expr_elements[$_] eq '>' } 0..$#expr_elements;
    foreach my $index (sort { $b <=> $a } @gt_indexes) {
        my $answer = $expr_elements[$index - 1] > $expr_elements[$index + 1] ? 1 : 0;
        splice @expr_elements, $index - 1, 3, ($answer);
    }

    my $answer = shift @expr_elements;

    return $answer;
}

