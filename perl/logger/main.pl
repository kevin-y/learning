#!/usr/bin/perl

use strict;
use warnings;

# use FindBin qw($Bin);
# BEGIN {
# 	unshift @INC, "$Bin";
# };

use constant LOG_LEVEL 			=> 'log.level';
use constant LOG_FORMAT 		=> 'log.format';
use constant LOG_APPENDER 		=> 'log.appender';
use constant LOG_FILE_LOCATION 	=> 'log.file.location';
use constant LOG_CONF_FILE		=> 'log.cnf';

use org::keviny::Config;

my $cnf = org::keviny::Config->new();
$cnf->load;
print $cnf->get(LOG_LEVEL), "\n";
print $cnf->get(LOG_FORMAT), "\n";
print $cnf->get(LOG_APPENDER), "\n";
print $cnf->get(LOG_FILE_LOCATION), "\n";
