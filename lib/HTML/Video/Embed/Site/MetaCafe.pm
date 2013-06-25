package HTML::Video::Embed::Site::MetaCafe;
use Moo;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/metacafe\.com/;
}

sub _build_validate_reg{
    return qr|^/watch/(\d+)/|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    if ( my ( $vid ) = $uri->path =~ m/${ \$self->validate_reg }/ ){
        return qq|<iframe src="http://www.metacafe.com/embed/${vid}/" class="${ \$embeder->class }" frameborder="0" allowfullscreen="1"></iframe>|;
    }
    
    return undef;
}

1;
