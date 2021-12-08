#!/usr/bin/perl -w
use experimental qw( say );
my $f = 'day-04-01.input';
open(FI, '<', $f) or die $!;
my $n = <FI>; chomp($n); my @numbers = split( /,/, $n );
use constant B => 5;

my @boards;

my ( $b, $r ) = 0;
for (<FI>) {
    chomp;
    if ( $_ !~ /\d/ ) { 
        $b++;
        $r = 0;
        next;
    }
    s/^ //;
    my @num = split( / +/, $_ );
    for ( my $c = 0; $c < B; $c++ ) {
        my $val = $num[$c];
        $boards[$b]->[$r]->{$val} = $val;
        $boards[$b]->[ $c + B ]->{$val} = $val;
    }
    $r++;
}
shift @boards;
close(FI);

for my $drawn (@numbers) {
    for my $board (@boards) {
        for my $line ( $board->@* ) {
            if ( exists $line->{$drawn} ) {
                $line->{$drawn} = 'X';
            }

            my @checked = grep {/X/} values $line->%*;
            if ( @checked == B ) {
                # WINNER!
                my $sum;
                for my $r ( 0 .. 4 ) {
                    for my $n ( keys $board->[$r]->%* ) {
                        $sum += $n unless $board->[$r]{$n} eq 'X';
                    }
                }
                say $sum;
                say $drawn;
                say $sum * $drawn;
                exit;
            }
        }
    }
}

# just copied from https://github.com/domm/advent_of_code/blob/main/2021/04_1.pl, not submitted
