use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $lon = <STDIN>);
chomp(my $lat = <STDIN>);
chomp(my $n = <STDIN>);
my @defibs;
for my $i (0..$n-1) {
    chomp(my $defib = <STDIN>);

    push @defibs, $defib;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

$lon =~ s/,/\./;
$lat =~ s/,/\./;

my @defib_maps;
foreach my $defib (@defibs) {
    my ($id, $name, $address, $phone, $longitude, $latitude) = split ';', $defib;
    $longitude =~ s/,/\./;
    $latitude =~ s/,/\./;

    my $x = ($lon - $longitude) * cos(($latitude + $lat) / 2);
    my $y = $lat - $latitude;
    my $distance = sqrt($x ** 2 + $y ** 2);

    my %defib_map = (
        'id'        => $id,
        'name'      => $name,
        'address'   => $address,
        'phone'     => $phone,
        'longitude' => $longitude,
        'latitude'  => $latitude,
        'distance'  => $distance
    );

    push @defib_maps, \%defib_map;
}

my %near_defib;
foreach my $defib_map (@defib_maps) {
    if (!(exists $near_defib{'name'}) || $defib_map->{'distance'} < $near_defib{'distance'}) {
        %near_defib = %$defib_map;
    }
}

# print "answer\n";
print "$near_defib{'name'}";

