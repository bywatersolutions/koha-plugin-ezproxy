package Koha::Plugin::Com::ByWaterSolutions::EZProxy::ApiController;

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# This program comes with ABSOLUTELY NO WARRANTY;

use Modern::Perl;

use C4::Context;
use C4::Auth qw(checkauth);

use Mojo::Base 'Mojolicious::Controller';
use Mojo::JSON qw(decode_json);
use Encode qw(encode_utf8);
use Template;

use Try::Tiny;

=head1 Koha::Plugin::Com::ByWaterSolutions::CoverFlow::Controller

A class implementing the controller code for CoverFlow requests

=head2 Class methods

=head3 get

Method that adds a new order from a GOBI request

=cut

sub check {
    my $c = shift->openapi->valid_input or return;

    my $username = $c->validation->param('username');
    my $password = $c->validation->param('password');

    return try {
        my ( $retval ) = checkpw( C4::Context->dbh, $username, $password );

        return $c->render(
            status => 200,
            text   => $retval ? 'OK' : 'ERROR',
        );
    }
    catch {
        return $c->render(
            status  => 500,
            openapi => { error => "Unhandled exception ($_)" }
        );
    };
}

1;
