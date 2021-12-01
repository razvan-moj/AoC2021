#!/usr/bin/perl -w
use experimental qw( say switch );
my $f = 'day-01-01';
open(FI, '<', "$f.input") or die $!;
open(FO, '>', "$f.output") or die $!;
our ($prev, $incdec, $inc);
$inc=0; $prev = <FI>; chomp($prev);
say FO "$prev (N/A - no previous measurement)";
while(<FI>) {
  chomp;
  for ($_) {
    when ($_ > $prev) { $incdec = "$_ increased" ; $inc++; } ;
    $incdec = "$_ decreased" when ($_ < $prev) ;
    $incdec = "$_ no change" when ($_ == $prev) ;
    default { $incdec = "$_ (math error)" }
  }
  $prev = $_;
  say FO $incdec; 
}
close(FI);
close(FO);
say $inc;
