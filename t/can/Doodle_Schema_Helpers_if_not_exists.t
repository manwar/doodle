use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

if_not_exists

=usage

  $self->if_not_exists;

=description

Used with the C<delete> method to denote that the table should be deleted only
if it already exists.

=signature

if_not_exists() : Schema

=type

method

=cut

# TESTING

use Doodle;
use Doodle::Schema::Helpers;

can_ok "Doodle::Schema::Helpers", "if_not_exists";

my $d = Doodle->new;
my $s = $d->schema('app');

$s->if_not_exists;

is $s->data->{if_not_exists}, 1;

ok 1 and done_testing;

