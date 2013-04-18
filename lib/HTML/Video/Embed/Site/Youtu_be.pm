package HTML::Video::Embed::Site::Youtu_be;
use Moo;

extends 'HTML::Video::Embed::Site::Youtube';

sub _build_domain_reg{
    return qr/youtu\.be/;
}

sub _build_validate_reg{
    return qr|^/([a-zA-Z0-9-_]{11})|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my ( $vid ) = $uri->path =~ m/${ \$self->validate_reg }/;
    return $self->_process( $embeder, $vid, $uri );
}

1;
