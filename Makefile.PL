# Load the Module::Install bundled in ./inc/
require 5.008;
use inc::Module::Install;

# Define metadata
name 'MooseX-Daemonize';
all_from 'lib/MooseX/Daemonize.pm';

# Specific dependencies
requires 'Proc::Daemon'   => 0;
requires 'Carp'           => 0;
requires 'File::Pid'      => 0;
requires 'MooseX::Getopt' => 0;
requires 'Moose'          => 0.20;

build_requires 'Test::More'  => 0;
build_requires 'File::Slurp' => 0;

no_index 'directory' => 'examples';

auto_install;
WriteAll;
