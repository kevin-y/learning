package org::keviny::LoggerFactory;

use strict;
use warnings;

use org::keviny::Logger;

sub new {
	my $class = shift;
	my $self = {};
	bless $self, $class;
}

sub getLogger {
	my $self = shift;
	if( not defined $self->{log}) {
		$self->log = org::keviny::Logger->new;
	}
	return $self->{log};
}