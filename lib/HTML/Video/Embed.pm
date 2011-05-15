package HTML::Video::Embed;
use Moose;
use namespace::autoclean;

use URI;
use URI::QueryParam;
use URI::Escape::XS;

use Data::Validate::URI qw/is_web_uri/;
use Module::Find;

our $VERSION = '0.002';
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

    my ( $domain_reg, $uri ) = $self->_is_video( $url );
    if ( defined( $domain_reg ) ){
        return $self->_modules->{ $domain_reg }->process( $self, $uri );
    }

    return undef;
}

sub _is_video{
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

=head1 NAME

HTML::Video::Embed - convert a url into a html embed string

=head1 SYNOPSIS

    use HTML::Video::Embed;

    my $embedder = HTML::Video::Embed->new({
        'width' => '570',
        'height' => '340',
    });

    my $url = 'http://www.youtube.com/watch?v=HMhks1TSFog';

    my $html_embed_code = $embedder->url_to_embed( $url );

$html_embed_code is now == "<iframe title="YouTube video player" width="570" height="340" src="http://www.youtube.com/embed/HMhks1TSFog" frameborder="0" allowfullscreen></iframe>"

=head1 DESCRIPTION

Converts urls into html embed codes, supported sites are

    Collegehumor
    DailyMotion
    FunnyOrDie
    Google
    Kontraband
    LiveLeak
    MegaVideo
    MetaCafe
    SpikedHumor
    Vimeo
    Yahoo
    Youtube

=head1 METHODS

=head2 new

takes two (optional) arguments, width and height, which sets the size of the video 

=head2 url_to_embed

converts a url into the html embed code

=head1 SUPPORT

Bugs should always be submitted via the CPAN bug tracker

For other issues, contact the maintainer

=head1 AUTHORS

n0body E<lt>n0body@thisaintnews.comE<gt>

=head1 SEE ALSO

L<http://thisaintnews.com>

=head1 LICENSE

Copyright (C) 2011 by n0body L<http://thisaintnews.com/>

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
