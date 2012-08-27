package HTML::Video::Embed::Site::YahooScreen;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/screen\.yahoo\.com/;
}

sub _build_validate_reg{
    return qr|\w+\-(\d+)\.html|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    if ( my ( $vid ) = $uri->path =~ m/$validate_reg/ ){

        if ( !$vid ){
            return undef;
        }

        return $self->_embed_html( $embeder, $vid );
    }

    return undef;
}

sub _embed_html{
    my ( $self, $embeder, $vid ) = @_;
        
    return '<iframe frameborder="0" '
        .'class="' . $embeder->class . '" '
        .'src="http://d.yimg.com/nl/vyc/site/player.html#browseCarouselUI=hide&startScreenCarouselUI=hide&vid=' . $vid .'&repeat=0"></iframe>';
}

__PACKAGE__->meta->make_immutable;
