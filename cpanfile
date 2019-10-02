requires "Data::Object" => "1.87";
requires "perl" => "5.014";

on 'test' => sub {
  requires "Data::Object" => "1.87";
  requires "Test::Auto" => "0.03";
  requires "perl" => "5.014";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};
