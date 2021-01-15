use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $encrypt = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @binaries;
my $valid_flag = 1;
my @encrypt_elements = split ' ', $encrypt;
for (my $i = 0; $i <= $#encrypt_elements; $i += 2) {
    my $binary = $encrypt_elements[$i];
    my $count = $i < $#encrypt_elements ? length($encrypt_elements[$i + 1]) : 0;

    if ($binary !~ m/^0{1,2}$/ || $count == 0) {
        $valid_flag = 0;
        last;
    } else {
        push @binaries, (($binary eq '0' ? '1' : '0') x $count);
    }
}

my $binaries_str = join '', @binaries;
my $result = '';
if ($valid_flag  && length($binaries_str) % 7 == 0) {
    foreach my $binary ($binaries_str =~ /.{7}/g) {
        $result .= chr(oct('0b'.$binary));
    }
} else {
    $result = 'INVALID';
}

# print "INVALID\n";
print "$result";

