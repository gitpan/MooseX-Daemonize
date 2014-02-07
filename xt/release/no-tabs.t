use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.06

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'examples/moose_room.pl',
    'lib/MooseX/Daemonize.pm',
    'lib/MooseX/Daemonize/Core.pm',
    'lib/MooseX/Daemonize/Pid.pm',
    'lib/MooseX/Daemonize/Pid/File.pm',
    'lib/MooseX/Daemonize/WithPidFile.pm',
    'lib/Test/MooseX/Daemonize.pm'
);

notabs_ok($_) foreach @files;
done_testing;
