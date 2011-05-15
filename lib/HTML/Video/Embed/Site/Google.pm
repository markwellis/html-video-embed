package HTML::Video::Embed::Site::Google;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/google\.com/;
}

sub _build_validate_reg{
    return qr|^-?\w+$|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    my $google_id;

    if ( ($google_id = $uri->query_param('docid')) && ($google_id =~ m/$validate_reg/) ){
        return '<embed id="VideoPlayback"'
            .' src="http://video.google.com/googleplayer.swf?'
            .'docid=' . $google_id 
            .'&hl=en&fs=true" style="width:' . $embeder->width . 'px;height:' . $embeder->height . 'px"'
            .' allowFullScreen="true"'
            .' type="application/x-shockwave-flash">'
            .'</embed>';
    }

    return undef;
}

__PACKAGE__->meta->make_immutable;
