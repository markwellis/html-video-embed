package HTML::Video::Embed::Site::Vimeo;
use Moo;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/vimeo\.com/;
}

sub _build_validate_reg{
    return qr|^(?:/m)?/(\d+)|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    if ( my ( $vid ) = $uri->path =~ m/${ \$self->validate_reg }/ ){
        return qq|<iframe class="${ \$embeder->class }" src="http://player.vimeo.com/video/${vid}" frameborder="0" allowFullScreen="1"></iframe>|;
    }
    
    return undef;
}

1;
