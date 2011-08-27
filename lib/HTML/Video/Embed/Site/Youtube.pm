package HTML::Video::Embed::Site::Youtube;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/youtube\.com/;
}

sub _build_validate_reg{
    return qr|^[a-zA-Z0-9-_]{11}$|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;
    
    my $validate_reg = $self->validate_reg;
    my $youtube_id;

    if ( ($youtube_id = $uri->query_param('v')) && ($youtube_id =~ m/$validate_reg/) ){
        return '<iframe '
            .'title="YouTube video player" '
            .'width="' . $embeder->width . '" '
            .'height="' . $embeder->height . '" '
            .'src="http://www.youtube.com/embed/' . $youtube_id . '" '
            .'frameborder="0" '
            .'allowfullscreen="1"></iframe>';
    }

    return undef;
}

__PACKAGE__->meta->make_immutable;
