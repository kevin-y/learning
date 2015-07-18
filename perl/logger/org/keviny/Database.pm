package org::keviny::Database;

use strict;
use warnings;

sub new {
	my $class = shift; 
	my $self = bless {}, $class;
	return $self;
}

