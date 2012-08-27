package HTML::Video::Embed::Site::EbaumsWorld;
use Moose;
use namespace::autoclean;

with 'HTML::Video::Embed::Module';

sub _build_domain_reg{
    return qr/ebaumsworld\.com/;
}

sub _build_validate_reg{
    return qr|^/video/watch/(\d+)/|;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $validate_reg = $self->validate_reg;
    if ( my ($vid) = $uri->path =~ m/$validate_reg/ ){
        if ( (!$vid) ){
            return undef;
        }

        return '<embed src="http://www.ebaumsworld.com/player.swf" '
            .'allowScriptAccess="always" '
            .'flashvars="id1=' . $vid . '" '
            .'wmode="transparent" '
            .'class="' . $embeder->class . '" '
            .'allowfullscreen="true" />';
    }
    
    return undef;
}

__PACKAGE__->meta->make_immutable;
