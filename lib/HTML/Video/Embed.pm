package HTML::Video::Embed;
use Moose;
use namespace::autoclean;

use URI;
use URI::QueryParam;
use URI::Escape::XS;

use Data::Validate::URI qw/is_web_uri/;
use Module::Find;

our $VERSION = '0.001';
$VERSION = eval $VERSION;

has 'width' => (
    'is' => 'rw',
    'isa' => 'Num',
    'default' => '450',
);

has 'height' => (
    'is' => 'rw',
    'isa' => 'Num',
    'default' => '370',
);

has '_modules' => (
    'is' => 'ro',
    'isa' => 'HashRef[Object]',
    'init_arg' => undef,
    'builder' => '_build__modules',
);

sub _build__modules{
    my ( $self ) = @_;

    my $namespace = ref( $self ) . "::Site";

    my @mods = useall( $namespace );

    my $modules = {};
    foreach my $mod ( @mods ){
        my $module = $mod->new;
        $modules->{ $module->domain_reg } = $module;
    }

    return $modules;
}

sub url_to_embed{
    my ( $self, $url ) = @_;

    my ( $domain_reg, $uri ) = $self->is_video( $url );
    if ( defined( $domain_reg ) ){
        return $self->_modules->{ $domain_reg }->process( $self, $uri );
    }

    return undef;
}

sub is_video{
    my ( $self, $url ) = @_;

    return undef if ( !is_web_uri($url) );

    my $uri = URI->new( URI::Escape::XS::uri_unescape($url) );

    foreach my $domain_reg ( keys(%{ $self->_modules }) ){
#figure out if url is supported
        if ( $uri->host =~ m/$domain_reg/ ){
            return ( $domain_reg, $uri );
        }
    }

    return undef;
}

__PACKAGE__->meta->make_immutable;
