#!/usr/bin/perl

use strict;
use warnings;

use FindBin qw($Bin);
# BEGIN {
# 	unshift @INC, "$Bin";
# };

use org::keviny::Config;

my $cnf = org::keviny::Config->new;
print $cnf->get('test'), "\n";