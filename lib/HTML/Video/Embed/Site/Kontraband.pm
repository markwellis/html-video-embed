package HTML::Video::Embed::Site::Kontraband;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/kontraband\.com/;
}

sub _build_validate_reg{
    return qr|^/videos/(\d+)/.*|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    if ( my ($vid) = $uri->path =~ m/$validate_reg/ ){
        if ( (!$vid) ){
            return undef;
        }
        return '<embed class="' . $embeder->class . '" '
            .'flashvars="file=http://208.116.9.205/10/content/' . $vid . '/450.flv" '
            .'usefullscreen="true" allowfullscreen="true" quality="high" '
            .'name="kbvideo" id="kbvideo" src="http://www.kontraband.com/show/4.5.swf" '
            .'type="application/x-shockwave-flash"/>';
    }
    
    return undef;
}

__PACKAGE__->meta->make_immutable;
