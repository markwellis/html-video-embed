package HTML::Video::Embed::Site::FunnyOrDie;
use Moo;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/funnyordie\.com/;
}

sub _build_validate_reg{
    return qr|^/videos/(\w+)|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    if ( my ( $vid ) = $uri->path =~ m/${ \$self->validate_reg }/ ){
        return qq|<iframe class="${ \$embeder->class }" src="http://www.funnyordie.com/embed/${vid}" frameborder="0" allowFullScreen="1"></iframe>|;
    }
    
    return undef;
}

1;
