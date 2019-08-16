use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

type_integer_tiny

=usage

  $self->type_integer_tiny($column);

  # smallint

=description

Returns the type expression for a integer_tiny column.

=signature

type_integer_tiny(Column $column) : Str

=type

method

=cut

# TESTING

use Doodle;

use_ok 'Doodle::Grammar::Postgres', 'type_integer_tiny';

my $d = Doodle->new;
my $g = Doodle::Grammar::Postgres->new;
my $t = $d->table('users');
my $c = $t->integer_tiny('data');
my $s = $g->type_integer_tiny($c);

is $s, 'smallint';

ok 1 and done_testing;
