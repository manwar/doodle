use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

wrap

=usage

  my $wrapped = $self->wrap('data');

  # [data]

=description

Returns a wrapped SQL identifier.

=signature

wrap(Str $arg) : Str

=type

method

=cut

# TESTING

use_ok 'Doodle::Grammar::Mssql', 'wrap';

use Doodle::Grammar::Mssql;

my $g = Doodle::Grammar::Mssql->new;

isa_ok $g, 'Doodle::Grammar::Mssql';

is $g->wrap('data'), '[data]';

ok 1 and done_testing;
