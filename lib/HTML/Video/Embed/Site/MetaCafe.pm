package HTML::Video::Embed::Site::MetaCafe;
use Moo;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/metacafe\.com/;
}

sub _build_validate_reg{
    return qr|^/watch/(\d+/\w+)/.*|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    if ( my ( $vid ) = $uri->path =~ m/${ \$self->validate_reg }/ ){
        return qq|<embed flashVars="playerVars=autoPlay=no" src="http://www.metacafe.com/fplayer/${vid}.swf" class="${ \$embeder->class }" wmode="transparent" allowFullScreen="true" type="application/x-shockwave-flash"></embed>|;
    }
    
    return undef;
}

1;
