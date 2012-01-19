package HTML::Video::Embed::Site::Youtu_be;
use Moose;
use namespace::autoclean;

extends 'HTML::Video::Embed::Site::Youtube';

sub _build_domain_reg{
    return qr/youtu\.be/;
}

sub _build_validate_reg{
    return qr|^/([a-zA-Z0-9-_]{11})$|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;
    
    my $validate_reg = $self->validate_reg;
    if ( my ($youtube_id) = $uri->path =~ m/$validate_reg/ ){
        return $self->_embed_html( $embeder, $youtube_id );
    }
    return undef;
}

__PACKAGE__->meta->make_immutable;
