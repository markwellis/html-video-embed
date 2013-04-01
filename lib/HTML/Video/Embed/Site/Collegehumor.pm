package HTML::Video::Embed::Site::Collegehumor;
use Moo;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/collegehumor\.com/;
}

sub _build_validate_reg{
    return qr|^/video[:\/](\d+)|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    if ( my ( $vid ) = $uri->path =~ m/${ \$self->validate_reg }/ ){
        return qq|<iframe class="${ \$embeder->class }" src="http://www.collegehumor.com/e/${vid}" frameborder="0" allowFullScreen="1"></iframe>|;
    }
    
    return undef;
}

1;
