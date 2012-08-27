package HTML::Video::Embed::Site::MegaVideo;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/megavideo\.com/;
}

sub _build_validate_reg{
    return qr|^\w+$|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    my $megavideo_id;

    if ( ($megavideo_id = $uri->query_param('v')) && ($megavideo_id =~ m/$validate_reg/) ){
        return '<object class="' . $embeder->class . '">'
            .'<param name="movie" value="http://www.megavideo.com/v/' . $megavideo_id . '" />'
            .'<param name="allowFullScreen" value="true" />'
            .'<embed src="http://www.megavideo.com/v/' . $megavideo_id . '" type="application/x-shockwave-flash" '
            .'allowfullscreen="true" class="' . $embeder->class . '"></embed></object>';
    }

    return undef;
}

__PACKAGE__->meta->make_immutable;
