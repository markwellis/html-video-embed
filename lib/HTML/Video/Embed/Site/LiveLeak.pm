package HTML::Video::Embed::Site::LiveLeak;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/liveleak\.com/;
}

sub _build_validate_reg{
    return qr|^\w{3}_\w{10}$|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    my $leak_id;

    if ( ($leak_id = $uri->query_param('i')) && ($leak_id =~ m/$validate_reg/) ){
        return '<object class="' . $embeder->class . '">'
            .'<param name="movie" value="http://www.liveleak.com/e/' . $leak_id . '" />'
            .'<param name="wmode" value="transparent" />'
            .'<embed src="http://www.liveleak.com/e/' . $leak_id . '" type="application/x-shockwave-flash"'
            .' wmode="transparent" class="' . $embeder->class . '">'
            .'</embed></object>';
    }

    return undef;
}

__PACKAGE__->meta->make_immutable;
