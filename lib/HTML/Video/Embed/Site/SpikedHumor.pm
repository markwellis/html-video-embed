package HTML::Video::Embed::Site::SpikedHumor;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/spikedhumor\.com/;
}

sub _build_validate_reg{
    return qr|^/articles/(\d+)/.*$|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    if ( my ($vid) = $uri->path =~ m/$validate_reg/ ){
        if ( (!$vid) ){
            return undef;
        }

        return '<embed src="http://www.spikedhumor.com/player/vcplayer.swf?file=http://www.spikedhumor.com/videocodes/'
            . $vid . '/data.xml&auto_play=false" quality="high" '
            .'scale="noscale" bgcolor="#000000" width="' . $embeder->width . '" '
            .'height="' . $embeder->height . '" align="middle" '
            .'type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />';
    }
    
    return undef;
}

__PACKAGE__->meta->make_immutable;
