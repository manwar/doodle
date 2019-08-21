package Doodle::Migration;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

use Carp;
use Data::Object::Space;
use Doodle;

# VERSION

# METHODS

method down(Doodle $d) {
  # this class is meant to be overwritten

  confess("This method is meant to be overwritten by the subclass");
}

method migrate(Str $updn, Str $grammar, CodeRef $callback) {
  my $results = [];

  my $statements = $self->statements($grammar);

  $statements = [reverse(@$statements)] if $updn eq 'down';

  for my $set (@$statements) {
    my $up_set = $set->[0];
    my $dn_set = $set->[1];

    push @$results, $callback->($updn eq 'up' ? $up_set : $dn_set);
  }

  return $results;
}

method migrations() {
  my $migrations = [];

  my $namespace = $self->namespace;

  my $space = Data::Object::Space->new($namespace);

  for my $item (sort { $a->name cmp $b->name } @{$space->children}) {
    my $class = eval { $item->load };

    next if !$class;
    next if !$class->isa('Doodle::Migration');

    push @$migrations, $item->name;
  }

  return $migrations;
}

method namespace() {
  # this method could be overwritten

  return ref $self;
}

method statements(Str $grammar) {
  my $statements = [];

  my $doodle = Doodle->new;
  my $migrations = $self->migrations;
  my $handler = $doodle->grammar($grammar);

  for my $migration (@$migrations) {
    my $object = $migration->new;

    my $up_object = $object->up(Doodle->new);
    my $dn_object = $object->down(Doodle->new);

    my $up_statements = $up_object->statements($handler);
    my $dn_statements = $dn_object->statements($handler);

    push @$statements, [
      [map { $_->sql } @{$up_statements}],
      [map { $_->sql } @{$dn_statements}]
    ];
  }

  return $statements;
}

method up(Doodle $d) {
  # this class is meant to be overwritten

  confess("This method is meant to be overwritten by the subclass");
}

1;
