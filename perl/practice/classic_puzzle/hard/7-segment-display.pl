use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
chomp(my $c = <STDIN>);
chomp(my $s = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

sub get_segment_char {
    my ($num, $pos, $c) = @_;

    my @segment_zero  = ('t', 'tl', 'tr',      'bl', 'br', 'b');
    my @segment_one   = (           'tr',            'br'     );
    my @segment_two   = ('t',       'tr', 'c', 'bl',       'b');
    my @segment_three = ('t',       'tr', 'c',       'br', 'b');
    my @segment_four  = (     'tl', 'tr', 'c',       'br',    );
    my @segment_five  = ('t', 'tl',       'c',       'br', 'b');
    my @segment_six   = ('t', 'tl',       'c', 'bl', 'br', 'b');
    my @segment_seven = ('t',       'tr',            'br'     );
    my @segment_eight = ('t', 'tl', 'tr', 'c', 'bl', 'br', 'b');
    my @segment_nine  = ('t', 'tl', 'tr', 'c',       'br', 'b');
    my @SEGMENTS = (
        \@segment_zero, \@segment_one, \@segment_two, \@segment_three, \@segment_four,
        \@segment_five, \@segment_six, \@segment_seven, \@segment_eight, \@segment_nine
    );

    return (grep { $_ eq $pos } @{$SEGMENTS[$num]}) ? $c : ' ';
}

my @answer;
foreach my $digit (split '', $n) {
    my $tl = get_segment_char($digit, 'tl', $c) x $s;
    my $bl = get_segment_char($digit, 'bl', $c) x $s;
    my @left_rows = split '', " $tl $bl ";
    push @answer, \@left_rows;

    my $top    = get_segment_char($digit, 't', $c);
    my $center = get_segment_char($digit, 'c', $c);
    my $bottom = get_segment_char($digit, 'b', $c);
    my $space = ' ' x $s;
    my $tbc = "$top$space$center$space$bottom";
    my @center_rows = split '', $tbc;
    foreach my $i (0..($s - 1)) {
        push @answer, \@center_rows;
    }

    my $tr = get_segment_char($digit, 'tr', $c) x $s;
    my $br = get_segment_char($digit, 'br', $c) x $s;
    my @right_rows = split '', " $tr $br ";
    push @answer, \@right_rows;

    my @space_rows = split '', ' ' x ($s * 2 + 3);
    push @answer, \@space_rows;
}

# print "answer\n";
foreach my $row (transpose(@answer)) {
    my $result = join '', @{$row};
    $result =~ s/\s+$//;

    print "$result\n";
}


sub transpose {
    my @dimension_array = @_;

    my @result;
    my @first_row = @{$dimension_array[0]};
    foreach my $column_index (0..$#first_row) {
        my @row;
        foreach my $row_index (0..$#dimension_array) {
            push @row, @{$dimension_array[$row_index]}[$column_index];
        }

        push @result, \@row;
    }

    return @result;
}

