#!/usr/bin/perl -w
use experimental qw( say );
use Tie::File;
use List::Util qw( sum );
my $f = 'day-01-01.input';
tie @data, 'Tie::File', $f or die $!;
use constant WINDOW => 3;
my (@sums, @slide);
for my $dp ( @data ) {
  push @slide, $dp;
  shift @slide if @slide > WINDOW;
  push @sums, sum(@slide) if @slide == WINDOW;
}
my $init = shift @sums;
my $inc = 0;
for my $sum ( @sums ) { $inc++ if $sum > $init ; $init = $sum ; }
say $inc;
