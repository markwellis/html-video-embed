package HTML::Video::Embed::Site::YahooScreen;
use Moo;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/screen\.yahoo\.com/;
}

sub _build_validate_reg{
    return qr|\w+\-(\d+)\.html|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    if ( my ( $vid ) = $uri->path =~ m/${ \$self->validate_reg }/ ){
        return qq|<iframe class="${ \$embeder->class }" src="http://d.yimg.com/nl/vyc/site/player.html#browseCarouselUI=hide&startScreenCarouselUI=hide&vid=${vid}&repeat=0" frameborder="0" allowfullscreen="1"></iframe>|;
    }

    return undef;
}

1;
