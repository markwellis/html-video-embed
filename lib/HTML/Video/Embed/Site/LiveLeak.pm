package HTML::Video::Embed::Site::LiveLeak;
use Moo;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/liveleak\.com/;
}

sub _build_validate_reg{
    return qr|^\w{3}_\w{10}$|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $vid = $uri->query_param('i') || '';
    if ( $vid =~ m/${ \$self->validate_reg }/ ){
        return qq|<iframe class="${ \$embeder->class }" src="http://www.liveleak.com/ll_embed?i=${vid}" frameborder="0" allowFullScreen="1"></iframe>|;
    }

    return undef;
}

1;
