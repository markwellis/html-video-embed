package HTML::Video::Embed::Site::Youtube;
use Moo;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/youtube\.com/;
}

sub _build_validate_reg{
    return qr|^[a-zA-Z0-9-_]{11}$|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;
    
    my $vid = $uri->query_param('v') || '';
    if ( $vid =~ m/${ \$self->validate_reg }/ ){
        return $self->_embed_html( $embeder, $vid );
    }

    return undef;
}

#this is here so youtu.be can subclass this module and use the same embed code 
sub _embed_html{
    my ( $self, $embeder, $vid ) = @_;
        
    return qq|<iframe class="${ \$embeder->class }" src="http://www.youtube.com/embed/${vid}" frameborder="0" allowfullscreen="1"></iframe>|;
}

1;
