use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    'width' => 450,
    'height' => 370,
});

is( $embeder->url_to_embed('http://www.youtu.be/xExSdzkZZB0'),  
    '<iframe title="YouTube video player" width="450" height="370" src="http://www.youtube.com/embed/xExSdzkZZB0" frameborder="0" allowfullscreen="1"></iframe>',

    'youtube embed works'
);

is( $embeder->url_to_embed('http://youtu.be/xExSdzkZZB0'),  
    '<iframe title="YouTube video player" width="450" height="370" src="http://www.youtube.com/embed/xExSdzkZZB0" frameborder="0" allowfullscreen="1"></iframe>',

    'youtube embed works'
);

is( $embeder->url_to_embed('http://www.youtu.be/xExxSdzkZZB0'), undef, 'invalid id');
is( $embeder->url_to_embed('http://www.youtu.be/'), undef, 'no v=');
is( $embeder->url_to_embed('http://www.y0utu.be/xExxSdzkZZB0'), undef, 'y0utube, not youtube');

done_testing;
