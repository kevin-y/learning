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
	# set defaults
	my $self = bless {
		'log.level' 		=> DEFAULT_LOG_LEVEL,
		'log.file.location' => DEFAULT_LOG_FILE_LOCATION,
		'log.appender' 		=> DEFAULT_LOG_APPENDER,
		'log.format' 		=> DEFAULT_LOG_FORMAT
	}, $class;
	return $self;
}

sub load {
	my $self = shift;
	my $configFile = shift;
	
	
	if( not defined $configFile ) {
		# use default configuration file
		$configFile = "$Bin/" . DEFAULT_CONF_FILE;
	}

	
	-e $configFile or die "ERROR: $configFile does not exist!\n";

	# if( ! -e $configFile) {
	# 	print "ERROR: $configFile does not exist!\n";
	# 	exit -1;
	# }

	# Load configurations from file
	# Any line starts with a `#` is a comment and should be left out, spaces before `#` should be ignored
	# A valid line has the pattern key=value, leave alone the spaces around the `=` sign
	my $fh;
	open $fh, '<', $configFile 
		or die "ERROR: Cannot open $configFile! $!\n";
	while(<$fh>) {
		chomp;
		# remove comments
		# next if $_ =~ m/^\s*#/i;
		next if $_ =~ m/\s*#/;
		# extract key & value pairs
		my($k, $v)= split /\s*=\s*/, $_;		
		$self->{$k} = $v;
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