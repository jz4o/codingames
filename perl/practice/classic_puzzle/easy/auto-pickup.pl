use strict;
use warnings;
#use diagnostics;
use 5.32.1;

use Class::Struct;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
chomp(my $packet = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

struct Packet => {
    instruction_id => '$',
    packet_length => '$',
    packet_info => '$'
};

my @packets = ();
while (length $packet > 0) {
    my $instruction_id = substr $packet, 0, 3;
    my $packet_length = substr $packet, 3, 4;
    my $decimal_packet_length = oct('0b' . $packet_length);
    my $packet_info = substr $packet, 7, $decimal_packet_length;
    $packet = substr $packet, 7 + $decimal_packet_length;

    my $packet_instance = Packet->new();
    $packet_instance->instruction_id($instruction_id);
    $packet_instance->packet_length($packet_length);
    $packet_instance->packet_info($packet_info);

    push(@packets, $packet_instance);
}

@packets = grep { $_->instruction_id == '101' } @packets;
my @result_array = map { '001' . $_->packet_length . $_->packet_info } @packets;
my $result = join '', @result_array;

# print "001[length][item id]\n";
print $result;
