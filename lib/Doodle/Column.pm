package Doodle::Column;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

with 'Doodle::Column::Helpers';

# VERSION

has name => (
  is => 'ro',
  isa => 'Str',
  req => 1
);

has table => (
  is => 'ro',
  isa => 'Table',
  req => 1
);

has type => (
  is => 'rw',
  isa => 'Str',
  def => 'string'
);

has data => (
  is => 'ro',
  isa => 'Data',
  new => 1
);

# BUILD

fun new_data($self) {
  return {};
}

# METHODS

method BUILD($args) {
  for my $key (keys %$args) {
    $self->{data}{$key} = $args->{$key} if !$self->can($key);
  }

  return $self;
}

method doodle() {
  my $doodle = $self->table->doodle;

  return $doodle;
}

method create(Any %args) {
  my $table = $self->table;

  $args{table} = $table;
  $args{schema} = $table->schema if $table->schema;
  $args{columns} = [$self];

  my $command = $self->doodle->column_create(%args);

  return $command;
}

method update(Any %args) {
  my $table = $self->table;

  $args{table} = $table;
  $args{schema} = $table->schema if $table->schema;
  $args{columns} = [$self];

  $self->data->set(drop => delete $args{drop}) if $args{drop};
  $self->data->set(set => delete $args{set}) if $args{set};

  my $command = $self->doodle->column_update(%args);

  return $command;
}

method delete(Any %args) {
  my $table = $self->table;

  $args{table} = $table;
  $args{schema} = $table->schema if $table->schema;
  $args{columns} = [$self];

  my $command = $self->doodle->column_delete(%args);

  return $command;
}

method rename(Str $name, Any %args) {
  my $table = $self->table;

  $args{table} = $table;
  $args{schema} = $table->schema if $table->schema;
  $args{columns} = [$self];

  $self->data->{to} = $name;

  my $command = $self->doodle->column_rename(%args);

  return $command;
}

1;
