#
# NethServer Password
#

#
# Copyright (C) 2012 Nethesis S.r.l.
# http://www.nethesis.it - support@nethesis.it
# 
# This script is part of NethServer.
# 
# NethServer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License,
# or any later version.
# 
# NethServer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with NethServer.  If not, see <http://www.gnu.org/licenses/>.
#

package NethServer::Password;

use MIME::Base64 qw(encode_base64);

=head1 NAME

NethServer::Password module

=cut

=head2 makePassword($length)

Generate and returns a  random password of $length characters

=cut
sub makePassword
{
    my $length = shift || 16;
    my $password;
    open(RANDOM, "<", "/dev/urandom") or { warn "Cannot open /dev/urandom"; return undef };
    read(RANDOM, $password, 128);
    encode_base64($password);
    close(RANDOM);
    return substr($password, 0, $length);
}
