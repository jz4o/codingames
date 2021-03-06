use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'min';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $phrase = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

sub get_alphabets_every_by {
    my ($num) = @_;

    my @ALPHABETS = ('A'..'Z');

    my @result;
    while (my ($index, $alphabet) = each @ALPHABETS) {
        push @result, $alphabet if ($index + 1) % $num == 0;
    }

    return @result;
}

sub get_indexes {
    my ($str, @search_array) = @_;

    my @chars = split '', $str;
    my @result;
    while (my ($index, $char) = each (@chars)) {
        push @result, $index if grep { $_ eq $char } @search_array;
    }

    return @result;
}

sub part_shift {
    my ($str, @indexes) = @_;

    while (my ($index, $index_in_str) = each (@indexes)) {
        last if $index == $#indexes;

        my $next_index_in_str = $indexes[$index + 1];
        my $left = min($index_in_str, $next_index_in_str);
        my $right = abs($index_in_str - $next_index_in_str) - 1;

        $str =~ s/(.{$left})(.)(.{$right})(.)/$1$4$3$2/;
    }

    return $str;
}

sub part_unshift {
    my ($str, @indexes) = @_;

    my @reversed_indexes = reverse @indexes;
    return part_shift($str, @reversed_indexes);
}

sub part_reverse {
    my ($str, @indexes) = @_;

    while (scalar(@indexes) >= 2) {
        my $shift_index = shift @indexes;
        my $pop_index = pop @indexes;

        my $left = min($shift_index, $pop_index);
        my $right = abs($shift_index - $pop_index) - 1;

        $str =~ s/(.{$left})(.)(.{$right})(.)/$1$4$3$2/;
    }

    return $str;
}

# reverse word length
my @size_of_words = map { length $_ } split ' ', $phrase;
my @phrase_chars = grep { $_ !~ /\s/ } split '', $phrase;
my @words = map { join '', splice(@phrase_chars, 0, $_) } reverse @size_of_words;
my $temp_phrase = join ' ', @words;

# unshift every 4th alphabets
$temp_phrase = part_unshift($temp_phrase, get_indexes($temp_phrase, get_alphabets_every_by(4)));

# shift every 3rd alphabets
$temp_phrase = part_shift($temp_phrase, get_indexes($temp_phrase, get_alphabets_every_by(3)));

# reverse every 2nd alphabets
$temp_phrase = part_reverse($temp_phrase, get_indexes($temp_phrase, get_alphabets_every_by(2)));

# print "answer\n";
print "$temp_phrase\n";

