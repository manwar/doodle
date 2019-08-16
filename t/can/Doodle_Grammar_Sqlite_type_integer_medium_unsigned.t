use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

type_integer_medium_unsigned

=usage

  $self->type_integer_medium_unsigned($column);

  # integer

=description

Returns the type expression for a integer_medium_unsigned column.

=signature

type_integer_medium_unsigned(Column $column) : Str

=type

method

=cut

# TESTING

use Doodle;

use_ok 'Doodle::Grammar::Sqlite', 'type_integer_medium_unsigned';

my $d = Doodle->new;
my $g = Doodle::Grammar::Sqlite->new;
my $t = $d->table('users');
my $c = $t->integer_medium_unsigned('data');
my $s = $g->type_integer_medium_unsigned($c);

is $s, 'integer';

ok 1 and done_testing;
