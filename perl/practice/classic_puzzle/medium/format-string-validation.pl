use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $text = <STDIN>);
chomp(my $format = <STDIN>);

my $regexp_format = $format;
$regexp_format =~ s/\\/\\\\/g;
$regexp_format =~ s/\^/\\^/g;
$regexp_format =~ s/\*/\\*/g;
$regexp_format =~ s/\(/\\(/g;
$regexp_format =~ s/\)/\\)/g;
$regexp_format =~ s/\[/\\[/g;
$regexp_format =~ s/\]/\\]/g;
$regexp_format =~ s/\{/\\{/g;
$regexp_format =~ s/\}/\\}/g;
$regexp_format =~ s/\$/\\\$/g;
$regexp_format =~ s/\|/\\\|/g;
$regexp_format =~ s/\?/./g;
$regexp_format =~ s/~/.*/g;

print $text =~ /$regexp_format/o ? 'MATCH' : 'FAIL';

