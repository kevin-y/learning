package org::keviny::Config;

use strict;
use warnings;

use FindBin qw($Bin);

use constant DEFAULT_CONF_FILE 			=> 'log.cnf';
use constant DEFAULT_LOG_LEVEL 			=> 'debug';
use constant DEFAULT_LOG_FILE_LOCATION 	=> '';
use constant DEFAULT_LOG_APPENDER		=> 'console';
use constant DEFAULT_LOG_FORMAT			=> '';

sub new {
	my $class = shift;

	my $self = {
		logLevel 		=> DEFAULT_LOG_LEVEL,
		logFileLocation => DEFAULT_LOG_FILE_LOCATION,
		logAppender 	=> DEFAULT_LOG_APPENDER,
		logFormat 		=> DEFAULT_LOG_FORMAT
	};
	bless $self, $class;
	return $self;
}

sub load {
	my $self = shift;
	my $configFile = shift;
	if( not defined $configFile ) {
		$configFile = "$Bin/" . DEFAULT_CONF_FILE;
	}
}

sub get {
	my $self = shift;
	my $key = shift;

	if(not defined $key) {
		return '';
	}

	if(not defined $self->{$key}) {
		return '';
	}
	return $self->{$key};
}

1;