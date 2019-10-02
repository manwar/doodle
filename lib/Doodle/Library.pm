package Doodle::Library;

use Data::Object 'Library';

our $Data = declare "Data",
  as HashLike;

our $Doodle = declare "Doodle",
  as InstanceOf["Doodle"];

our $Index = declare "Index",
  as InstanceOf["Doodle::Index"];

our $Indices = declare "Indices",
  as ArrayRef[$Index] | ArrayObject[$Index];

our $Statement = declare "Statement",
  as InstanceOf["Doodle::Statement"];

our $Statements = declare "Statements",
  as ArrayRef[$Statement] | ArrayObject[$Statement];

our $Grammar = declare "Grammar",
  as InstanceOf["Doodle::Grammar"];

our $Column = declare "Column",
  as InstanceOf["Doodle::Column"];

our $Columns = declare "Columns",
  as ArrayRef[$Column] | ArrayObject[$Column];

our $Command = declare "Command",
  as InstanceOf["Doodle::Command"];

our $Commands = declare "Commands",
  as ArrayRef[$Command] | ArrayObject[$Command];

our $Schema = declare "Schema",
  as InstanceOf["Doodle::Schema"];

our $Table = declare "Table",
  as InstanceOf["Doodle::Table"];

our $Relation = declare "Relation",
  as InstanceOf["Doodle::Relation"];

our $Relations = declare "Relations",
  as ArrayRef[$Relation] | ArrayObject[$Relation];

1;
