use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

increments_small

=usage

  my $increments_small = $self->increments_small('number');

=description

Registers an auto-incrementing small integer (2-byte) column and returns the Command object set.

=signature

increments_small(Str $name, Any %args) : Column

=type

method

=cut

# TESTING

use lib 't/lib';

use Test_Doodle_Column_Helpers;

my $test = Test_Doodle_Column_Helpers->new(
  table => 'users',
  column => 'number',
  method => 'increments_small'
);

$test->execute(sub {
  my $c = shift;

  is $c->type, 'integer_small';
  is $c->data->{increments}, 1;
});

ok 1 and done_testing;
