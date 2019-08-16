use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

type_text_long

=usage

  $self->type_text_long($column);

  # longtext

=description

Returns the type expression for a text_long column.

=signature

type_text_long(Column $column) : Str

=type

method

=cut

# TESTING

use Doodle;

use_ok 'Doodle::Grammar::Mysql', 'type_text_long';

my $d = Doodle->new;
my $g = Doodle::Grammar::Mysql->new;
my $t = $d->table('users');
my $c = $t->text_long('data');
my $s = $g->type_text_long($c);

is $s, 'longtext';

ok 1 and done_testing;
