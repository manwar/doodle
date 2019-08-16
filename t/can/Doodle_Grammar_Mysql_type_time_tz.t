use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

type_time_tz

=usage

  $self->type_time_tz($column);

  # time

=description

Returns the type expression for a time_tz column.

=signature

type_time_tz(Column $column) : Str

=type

method

=cut

# TESTING

use Doodle;

use_ok 'Doodle::Grammar::Mysql', 'type_time_tz';

my $d = Doodle->new;
my $g = Doodle::Grammar::Mysql->new;
my $t = $d->table('users');
my $c = $t->time_tz('data');
my $s = $g->type_time_tz($c);

is $s, 'time';

ok 1 and done_testing;
