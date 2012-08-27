package HTML::Video::Embed::Site::Vimeo;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/vimeo\.com/;
}

sub _build_validate_reg{
    return qr|^/(\d+).*|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    if ( my ($vid) = $uri->path =~ m/$validate_reg/ ){
        if ( (!$vid) ){
            return undef;
        }
        return '<object class="' . $embeder->class . '">'
            .'<param name="allowfullscreen" value="true" />'
            .'<param name="movie" value="'
            .'http://vimeo.com/moogaloop.swf?clip_id=' . $vid . '&amp;'
            .'server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" />'
            .'<embed src="http://vimeo.com/moogaloop.swf?clip_id=' . $vid . '&amp;'
            .'server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" '
            .'type="application/x-shockwave-flash" allowfullscreen="true" '
            .'class="' . $embeder->class . '"></embed></object>';
    }
    
    return undef;
}

__PACKAGE__->meta->make_immutable;
