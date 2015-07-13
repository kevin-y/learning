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

	my $self = bless {
		logLevel 		=> DEFAULT_LOG_LEVEL,
		logFileLocation => DEFAULT_LOG_FILE_LOCATION,
		logAppender 	=> DEFAULT_LOG_APPENDER,
		logFormat 		=> DEFAULT_LOG_FORMAT
	}, $class;
	return $self;
}

sub load {
	my $self = shift;
	my $configFile = shift;
	if( not defined $configFile ) {
		$configFile = "$Bin/" . DEFAULT_CONF_FILE;
	}

	# if( ! -e $configFile) {
	# 	print "ERROR: $configFile does not exist!\n";
	# 	exit -1;
	# }

	# Load configurations from file
	# Any line starts with a `#` is a comment and should be left out, spaces before `#` should be ignored
	# A valid line has the pattern key=value, leave alone the spaces around the `=` sign

	my $fh;
	open $fh, '<', $configFile 
		or die "ERROR: $configFile does not exist!\n";

	while(<$fh>) {
		## TODO
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