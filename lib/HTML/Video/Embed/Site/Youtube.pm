package HTML::Video::Embed::Site::Youtube;
use Moo;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/youtube\.com/;
}

sub _build_validate_reg{
    return qr|^([a-zA-Z0-9-_]{11})$|;
}

has 'timecode_reg' => (
    'is' => 'lazy',
);

sub _build_timecode_reg{
    return qr/(?:(\d+)h)?(?:(\d+)m)?(?:(\d+)s)/;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my ( $vid ) = ( $uri->query_param('v') || '' ) =~ m/${ \$self->validate_reg }/;

    return $self->_process( $embeder, $vid, $uri );
}

sub _process{
    my ( $self, $embeder, $vid, $uri ) = @_;

    if ( $vid ){
        my $timecode = $uri->query_param('t') || $uri->fragment || '';
        $vid .= '?rel=0&html5=1';
        if ( 
            defined( $timecode )
            && ( my @time = $timecode =~ m/${ \$self->timecode_reg }/ )
        ){
            my $start = 0;
            if ( $time[0] ){
            #hours
                $start += 3600 * $time[0];
            }
            if ( $time[1] ){
            #mins
                $start += 60 * $time[1];
            }
            if ( $time[2] ){
            #seconds
                $start += $time[2];
            }
            if ( $start ){
                $vid .= "&start=${start}";
            }
        }

        return qq|<iframe class="${ \$embeder->class }" src="https://www.youtube-nocookie.com/embed/${vid}" frameborder="0" allowfullscreen="1"></iframe>|;
    }

    return undef;
}

1;
