package HTML::Video::Embed::Site::MetaCafe;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/metacafe\.com/;
}

sub _build_validate_reg{
    return qr|^/watch/(\d+)/.*|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    if ( my ($vid) = $uri->path =~ m/$validate_reg/ ){
        if ( (!$vid) ){
            return undef;
        }

        return '<embed src="http://www.metacafe.com/fplayer/' . $vid . '/unimportant_info_i_hope.swf" '
            .'class="' . $embeder->class . '" '
            .'wmode="transparent" pluginspage="http://www.macromedia.com/go/getflashplayer" '
            .'type="application/x-shockwave-flash" allowFullScreen="true" name="Metacafe_' . $vid . '"></embed>';
    }
    
    return undef;
}

__PACKAGE__->meta->make_immutable;
