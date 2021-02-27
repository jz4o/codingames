use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @cgscontents;
for my $i (0..$n-1) {
    chomp(my $cgscontent = <STDIN>);

    push @cgscontents, $cgscontent;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my %variables;
my @characters;
my $replace_char = 'a';

my @replaced_cgscontents;
foreach my $cgscontent (@cgscontents) {
    # replace variable part
    my @matched_variables = $cgscontent =~ /\$.+?\$/g;
    foreach my $matched_variable (@matched_variables) {
        if (!exists $variables{$matched_variable}) {
            $variables{$matched_variable} = $replace_char;
            $replace_char++;
        }

        my $sanitized_matched_variable = $matched_variable;
        $sanitized_matched_variable =~ s/\$/\\\$/g;
        $cgscontent =~ s/${sanitized_matched_variable}/\$${variables{$matched_variable}}\$/;
    }

    # replace character part
    my @matched_characters = $cgscontent =~ /'.+?'/g;
    foreach my $matched_character (@matched_characters) {
        my $character_size = scalar @characters;
        $cgscontent =~ s/$matched_character/\$$character_size/g;

        push @characters, $matched_character;
    }

    $cgscontent =~ s/\s//g;
    push @replaced_cgscontents, $cgscontent;
}

# restore character part
my $result = join '', @replaced_cgscontents;
while (my ($index, $character) = each @characters) {
    $result =~ s/\$$index/$character/g;
}

# print "minified all CGS content\n";
print "$result\n";

