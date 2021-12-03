#!/usr/bin/perl -w
use experimental qw( say );
use Tie::File;
use List::Util qw( reduce );
my $f = 'day-03-01.input';
tie @data, 'Tie::File', $f or die $!;
my @a; my (@gamma, @epsilon);
for my $l ( @data ) {
  my $i=0;
  foreach my $b (split //, $l) {
    push @{$a[$i]}, $b;
    $i++;
  }
}
for my $l ( @a ) {
  my %count;
  for my $b ( @$l ) { $count{$b}++; }
  push @gamma, reduce { $count{$b} > $count{$a} ? $b : $a } keys %count;
  push @epsilon, reduce { $count{$b} < $count{$a} ? $b : $a } keys %count;
}
say oct('0b' . join('', @gamma)) * oct('0b' . join('', @epsilon));
