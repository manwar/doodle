use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

integer_small_unsigned

=usage

  my $integer_small_unsigned = $self->integer_small_unsigned('number');

=description

Registers an unsigned small integer (2-byte) column and returns the Command object set.

=signature

integer_small_unsigned(Str $name, Any %args) : Column

=type

method

=cut

# TESTING

use lib 't/lib';

use Test_Doodle_Column_Helpers;

my $test = Test_Doodle_Column_Helpers->new(
  table => 'users',
  column => 'number',
  method => 'integer_small_unsigned'
);

$test->execute;

ok 1 and done_testing;
