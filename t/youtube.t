use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    class => "video",
});

is( $embeder->url_to_embed('http://www.youtube.com/watch?v=xExSdzkZZB0'),  
    '<iframe title="YouTube video player" class="video" src="http://www.youtube.com/embed/xExSdzkZZB0" frameborder="0" allowfullscreen="1"></iframe>',

    'youtube embed works'
);

is( $embeder->url_to_embed('http://www.youtube.com/watch?v=xExxSdzkZZB0'), undef, 'invalid v=');
is( $embeder->url_to_embed('http://www.youtube.com/watch?h=xExxSdzkZZB0'), undef, 'no v=');
is( $embeder->url_to_embed('http://www.y0utube.com/watch?h=xExxSdzkZZB0'), undef, 'y0utube, not youtube');

done_testing;
