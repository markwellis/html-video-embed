package HTML::Video::Embed::Site::Kontraband;
use Moo;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/kontraband\.com/;
}

sub _build_validate_reg{
    return qr|^/videos/(\d+)/.*|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    if ( my ( $vid ) = $uri->path =~ m/${ \$self->validate_reg }/ ){
        return qq|<embed class="${ \$embeder->class }" flashvars="file=http://208.116.9.205/10/content/${vid}/450.flv" allowscriptaccess="always" usefullscreen="true" allowfullscreen="true" quality="high" name="kbvideo" id="kbvideo" src="http://stage.kontraband.com/show/5.2.swf" type="application/x-shockwave-flash"/>|;
    }
    
    return undef;
}

1;
