use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

timestamps_tz

=usage

  my $timestamps_tz = $self->timestamps_tz;

=description

Registers C<created_at>, C<updated_at> and C<deleted_at> columns with timezone
and returns the Command object set.

=signature

timestamps_tz() : [Column]

=type

method

=cut

# TESTING

use Doodle;
use Doodle::Table::Helpers;

can_ok "Doodle::Table::Helpers", "timestamps_tz";

my $d = Doodle->new;
my $t = $d->table('users');
my $x = $t->timestamps_tz;

my $created_at = $x->[0];
my $updated_at = $x->[1];
my $deleted_at = $x->[2];

isa_ok $created_at, 'Doodle::Column';
isa_ok $updated_at, 'Doodle::Column';
isa_ok $deleted_at, 'Doodle::Column';

is $created_at->type, 'datetime_tz';
is $created_at->data->{nullable}, 1;
is $updated_at->type, 'datetime_tz';
is $updated_at->data->{nullable}, 1;
is $deleted_at->type, 'datetime_tz';
is $deleted_at->data->{nullable}, 1;

ok 1 and done_testing;
