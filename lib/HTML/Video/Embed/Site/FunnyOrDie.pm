package HTML::Video::Embed::Site::FunnyOrDie;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/funnyordie\.com/;
}

sub _build_validate_reg{
    return qr|^/videos/(\w+)/.*|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    if ( my ($vid) = $uri->path =~ m/$validate_reg/ ){
        if ( (!$vid) ){
            return undef;
        }

        return '<object class="' . $embeder->class . '" id="ordie_player_' . $vid . '">'
            .'<param name="movie" value="http://player.ordienetworks.com/flash/fodplayer.swf" />'
            .'<param name="flashvars" value="key=' . $vid . '" />'
            .'<param name="allowfullscreen" value="true" />'
            .'<embed class="' . $embeder->class . '" flashvars="key=' . $vid . '" allowfullscreen="true" '
            .'quality="high" src="http://player.ordienetworks.com/flash/fodplayer.swf" '
            .'name="ordie_player_' . $vid . '" type="application/x-shockwave-flash"></embed></object>';
    }
    
    return undef;
}

__PACKAGE__->meta->make_immutable;
