use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    'width' => 450,
    'height' => 370,
});

is( $embeder->url_to_embed('http://www.collegehumor.com/video:1930495'),

    '<object type="application/x-shockwave-flash" data="http://www.collegehumor.com/moogaloop/moogaloop.swf?clip_id=1930495&fullscreen=1" width="450" height="370" ><param name="allowfullscreen" value="true"/><param name="wmode" value="transparent"/><param name="movie" quality="best" value="http://www.collegehumor.com/moogaloop/moogaloop.swf?clip_id=1930495&fullscreen=1"/><embed src="http://www.collegehumor.com/moogaloop/moogaloop.swf?clip_id=1930495&fullscreen=1" type="application/x-shockwave-flash" wmode="transparent" width="450" height="370"></embed></object>',

    'collegehumor embed works'
);

is( $embeder->url_to_embed('http://www.collegehumor.com/vdeo:1930495'), undef, 'invalid url');
is( $embeder->url_to_embed('http://www.collegehumor.com/video:'), undef, 'no video id');
is( $embeder->url_to_embed('http://www.c0llegehumor.com/video:1930495'), undef, 'c0llegehumor, not c0llegehumor');

done_testing;
