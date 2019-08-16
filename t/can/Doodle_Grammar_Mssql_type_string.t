use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

type_string

=usage

  $self->type_string($column);

  # nvarchar(255)

=description

Returns the type expression for a string column.

=signature

type_string(Column $column) : Str

=type

method

=cut

# TESTING

use Doodle;

use_ok 'Doodle::Grammar::Mssql', 'type_string';

my $d = Doodle->new;
my $g = Doodle::Grammar::Mssql->new;
my $t = $d->table('users');
my $c = $t->string('data');
my $s = $g->type_string($c);

is $s, 'nvarchar(255)';

ok 1 and done_testing;
