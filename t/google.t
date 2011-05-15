use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    'width' => 450,
    'height' => 370,
});

is( $embeder->url_to_embed('http://video.google.com/videoplay?docid=-2912878405399014351#'),

    '<embed id="VideoPlayback"'
        .' src="http://video.google.com/googleplayer.swf?'
        .'docid=-2912878405399014351' 
        .'&hl=en&fs=true" style="width:450px;height:370px"'
        .' allowFullScreen="true"'
        .' type="application/x-shockwave-flash">'
        .'</embed>'
    ,

    'google embed works'
);

is( $embeder->url_to_embed('http://video.google.com/videoplay?docid=*()#'), undef, 'invalid docid=');
is( $embeder->url_to_embed('http://video.google.com/videoplay?d0cid=-2912878405399014351#'), undef, 'no docid=');
is( $embeder->url_to_embed('http://video.g0ogle.com/videoplay?docid=-2912878405399014351#'), undef, 'g0ogle, not goolge');

done_testing;
