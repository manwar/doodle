use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

type_datetime_tz

=usage

  $self->type_datetime_tz($column);

  # datetimeoffset(0)

=description

Returns the type expression for a datetime_tz column.

=signature

type_datetime_tz(Column $column) : Str

=type

method

=cut

# TESTING

use Doodle;

use_ok 'Doodle::Grammar::Mssql', 'type_datetime_tz';

my $d = Doodle->new;
my $g = Doodle::Grammar::Mssql->new;
my $t = $d->table('users');
my $c = $t->datetime_tz('data');
my $s = $g->type_datetime_tz($c);

is $s, 'datetimeoffset(0)';

ok 1 and done_testing;
