use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    class => "video",
});

is( 
    $embeder->url_to_embed('http://www.youtu.be/xExSdzkZZB0'),  
    '<iframe class="video" src="http://www.youtube.com/embed/xExSdzkZZB0" frameborder="0" allowfullscreen="1"></iframe>',
    'youtube embed works'
);

is( 
    $embeder->url_to_embed('http://www.youtu.be/xExSdzkZZB0#t=01h53m22s&g=sdfsdf'),  
    '<iframe class="video" src="http://www.youtube.com/embed/xExSdzkZZB0#t=01h53m22s" frameborder="0" allowfullscreen="1"></iframe>',
    'youtube embed works (with timecode)'
);

is( 
    $embeder->url_to_embed('http://www.youtu.be/xExSdzkZZB0#t=sdfdsf'),
    '<iframe class="video" src="http://www.youtube.com/embed/xExSdzkZZB0" frameborder="0" allowfullscreen="1"></iframe>',
    'youtube embed works (no invalid timecode)'
);

is( $embeder->url_to_embed('http://www.youtu.be/xExxSdzZB0'), undef, 'invalid id');
is( $embeder->url_to_embed('http://www.youtu.be/'), undef, 'no v=');
is( $embeder->url_to_embed('http://www.y0utu.be/xExxSdzkZZB0'), undef, 'domain check');

done_testing;
