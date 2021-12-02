#!/usr/bin/perl -w
use experimental qw( say switch );
use Tie::File;
my $f = 'day-02-01.input';
tie @data, 'Tie::File', $f or die $!;
my $h = 0; my $v = 0;
for my $steer ( @data ) {
  my ($where, $howmuch) = $steer =~ /(\w+)\s+(\d+)/;
  for ($where) {
    $h += $howmuch when $where eq 'forward';
    $v += $howmuch when $where eq 'up';
    $v -= $howmuch when $where eq 'down';
  }
}
$v = abs($v);
say $h * $v;
