use lib 'inc';
use Devel::AssertOS qw[-MSWin32];

use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Role for daemonizing your Moose based application",
  "AUTHOR" => "Chris Prather <chris\@prather.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooseX-Daemonize",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MooseX::Daemonize",
  "PREREQ_PM" => {
    "File::Path" => "2.08",
    "Moose" => "0.33",
    "MooseX::Getopt" => "0.07",
    "MooseX::Types::Path::Class" => 0,
    "Sub::Exporter" => 0
  },
  "TEST_REQUIRES" => {
    "Test::Fatal" => 0,
    "Test::Moose" => 0,
    "Test::More" => "0.88"
  },
  "VERSION" => "0.18",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



