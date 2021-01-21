use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $s = <STDIN>);

while (is_encodable($s)) {
    $s = encode($s);
}

print "$s";


sub is_encodable {
    my ($origin) = @_;

    my $encoded = encode($origin);

    return $encoded ne '' && $origin ne $encoded;
}

sub encode {
    my ($origin) = @_;

    return '' if length($origin) % 2 == 1;

    my $encoded = '';
    my @chars = split '', $origin;
    for (my $i = 0; $i < scalar(@chars); $i += 2) {
        $encoded .= $chars[$i + 1] x $chars[$i];
    }

    return is_decodable($encoded, $origin) ? $encoded : '';
}

sub is_decodable {
    my ($encoded, $origin) = @_;

    my $decoded = '';
    my $str_temp = $encoded;
    while (length($str_temp) > 0) {
        my $first_char = substr $str_temp, 0, 1;

        $str_temp =~ /^$first_char+/p;
        my $matched = ${^MATCH};

        $str_temp =~ s/^$matched//;

        $decoded .= length($matched) . $first_char;
    }

    return $decoded eq $origin;
}

