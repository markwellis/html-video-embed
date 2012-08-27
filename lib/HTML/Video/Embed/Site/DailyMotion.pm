package HTML::Video::Embed::Site::DailyMotion;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/dailymotion\.com/;
}

sub _build_validate_reg{
    return qr|^/video/(\w+)_.*|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    if ( my ($vid) = $uri->path =~ m/$validate_reg/ ){
        if ( (!$vid) ){
            return undef;
        }

        return '<object class="' . $embeder->class . '">'
            .'<param name="movie" value="http://www.dailymotion.com/swf/video/' . $vid . '" />'
            .'<param name="allowFullScreen" value="true" />'
            .'<embed type="application/x-shockwave-flash" '
            .'src="http://www.dailymotion.com/swf/video/' . $vid . '" '
            .'class="' . $embeder->class . '" '
            .'allowfullscreen="true"></embed></object>';
    }
    
    return undef;
}

__PACKAGE__->meta->make_immutable;
