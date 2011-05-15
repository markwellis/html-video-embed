package HTML::Video::Embed::Site::Yahoo;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/video\.yahoo\.com/;
}

sub _build_validate_reg{
    return qr|^/watch/(\d+)/(\d+)|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    if ( my ($vid, $id) = $uri->path =~ m/$validate_reg/ ){

        if ( (!$vid) || (!$id) ){
            return undef;
        }

        return '<object width="' . $embeder->width . '" height="' . $embeder->height . '">'
            .'<param name="movie" value="http://d.yimg.com/static.video.yahoo.com/yep/YV_YEP.swf?ver=2.2.46" />'
           .'<param name="allowFullScreen" value="true" />'
            .'<param name="bgcolor" value="#000000" /><param name="flashVars" '
            .'value="id=' . $id . '&vid=' . $vid 
            .'&lang=en-gb&intl=uk&embed=1" />'
            .'<embed src="http://d.yimg.com/static.video.yahoo.com/yep/YV_YEP.swf?ver=2.2.46" '
            .'type="application/x-shockwave-flash" width="' . $embeder->width . '" height="' . $embeder->height . '" allowFullScreen="true" '
            .'bgcolor="#000000" '
            .'flashVars="id=' . $id . '&vid=' . $vid 
            .'&lang=en-gb&intl=uk&embed=1" ></embed></object>';
    }
    
    return undef;
}

__PACKAGE__->meta->make_immutable;
