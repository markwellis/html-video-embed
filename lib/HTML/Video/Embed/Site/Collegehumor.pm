package HTML::Video::Embed::Site::Collegehumor;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/collegehumor\.com/;
}

sub _build_validate_reg{
    return qr|^/video:(\d+)|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    if ( my ($vid) = $uri->path =~ m/$validate_reg/ ){
        if ( (!$vid) ){
            return undef;
        }

        return '<object type="application/x-shockwave-flash" '
            .'data="http://www.collegehumor.com/moogaloop/moogaloop.swf?clip_id=' . $vid . '&fullscreen=1" '
            .'width="' . $embeder->width . '" height="' . $embeder->height . '" ><param name="allowfullscreen" value="true"/>'
            .'<param name="wmode" value="transparent"/>'
            .'<param name="movie" quality="best" value="http://www.collegehumor.com/moogaloop/moogaloop.swf?clip_id='
            . $vid . '&fullscreen=1"/>'
            .'<embed src="http://www.collegehumor.com/moogaloop/moogaloop.swf?clip_id=' . $vid . '&fullscreen=1" '
            .'type="application/x-shockwave-flash" wmode="transparent" width="' . $embeder->width . '" height="' . $embeder->height . '"></embed></object>';
    }
    
    return undef;
}

__PACKAGE__->meta->make_immutable;
