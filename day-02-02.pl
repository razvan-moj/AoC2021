#!/usr/bin/perl -w
use experimental qw( say switch );
use Tie::File;
my $f = 'day-02.sample';
tie @data, 'Tie::File', $f or die $!;
my $h = 0; my $v = 0; my $a = 0;
for my $steer ( @data ) {
  my ($where, $howmuch) = $steer =~ /(\w+)\s+(\d+)/;
  for ($where) {
    when ($where eq 'forward') { $h += $howmuch; $v += $a*$howmuch; }
    $a -= $howmuch when $where eq 'up';
    $a += $howmuch when $where eq 'down';
  }
}
$v = abs($v);
say "$h $v";
say $h * $v;
