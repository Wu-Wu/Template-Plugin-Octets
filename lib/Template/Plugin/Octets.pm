package Template::Plugin::Octets;

use 5.008009;
use strict;
use warnings;
use base 'Template::Plugin::Procedural';

our $VERSION = '0.15';

use constant KIBIO_DIV => 1024;            # 1 KBio
use constant MIBIO_DIV => 1024*1024;       # 1 MBio
use constant GIBIO_DIV => 1024*1024*1024;  # 1 GBio

#
# kibioctets
sub kio { _formatter(KIBIO_DIV, $_[0]) }

#
# mebioctets
sub mio { _formatter(MIBIO_DIV, $_[0]) }

#
# gigioctets
sub gio { _formatter(GIBIO_DIV, $_[0]) }

#
# Format octets
sub _formatter {
    my ($divider, $value) = @_;

    $value = 0 if $value eq '' or !defined $value;

    $value = sprintf '%.1f', $value/$divider;

    return '~0' if $value eq '0.0';
    return $value;
}

1;
__END__

=head1 NAME

Template::Plugin::Octets - Format numeric value as binary octets

=head1 VERSION

version 0.15

=head1 SYNOPSIS

    [% USE Octets -%]
    [% Octets.mio(bytes_recv) %]

=head1 DESCRIPTION

Stub documentation for Template::Plugin::Octets, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

=head1 METHODS

=over

=item B<kio>

Format value to kibioctets (2^10 octets).

=item B<mio>

Format value to mebioctets (2^20 octets).

=item B<gio>

Format value to gibioctets (2^30 octets).

=back

=head1 SEE ALSO

L<Template>

L<Template::Plugin::Procedural>

=head1 AUTHOR

Anton Gerasimov, E<lt>chim@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Anton Gerasimov

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
