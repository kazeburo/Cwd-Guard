package Cwd::Guard;

use strict;
use warnings;
use Cwd qw/getcwd/;
use autodie qw/chdir/;
use parent 'Exporter';

our @EXPORT_OK = qw/cwd_guard/;

our $VERSION = '0.02';

sub cwd_guard {
    my $dir = shift;
    __PACKAGE__->new($dir);
}

sub new {
    my $class = shift;
    my $dir = shift;
    my $cwd = getcwd();
    my $callback = sub {
        chdir $cwd;
    };
    defined $dir ? chdir($dir) : chdir();
    bless $callback, $class;
}

sub DESTROY {
    $_[0]->();
}


1;
__END__

=head1 NAME

Cwd::Guard - Temporary changing working directory (chdir)

=head1 SYNOPSIS

  use Cwd::Guard qw/cwd_guard/;
  use Cwd;

  my $dir = getcwd;
  MYBLOCK: {
      my $guard = cwd_guard('/tmp/xxxxx');
      # chdir to /tmp/xxxxx
  }
  # back to $dir


=head1 DESCRIPTION

CORE::chdir Cwd:: Guard can change the current directory (chdir) using a limited scope.

=head1 FUNCTIONS

=over 4

=item cwd_guard($dir);

chdir to $dir and returns Cwd::Guard object. return to current working directory, if this object destroyed.
if failed to chdir, Cwd::Guard die immediately. 

=back

=head1 AUTHOR

Masahiro Nagano E<lt>kazeburo {at} gmail.comE<gt>

=head1 SEE ALSO

L<File::chdir>, L<File::pushd>

=head1 LICENSE

Copyright (C) Masahiro Nagano

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
