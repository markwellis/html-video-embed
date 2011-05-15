use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    'width' => 450,
    'height' => 370,
});

is( $embeder->url_to_embed('http://www.megavideo.com/?v=0BILAIF2'),

    '<object width="450" height="370"><param name="movie" value="http://www.megavideo.com/v/0BILAIF2" /><param name="allowFullScreen" value="true" /><embed src="http://www.megavideo.com/v/0BILAIF2" type="application/x-shockwave-flash" allowfullscreen="true" width="450" height="370"></embed></object>',

    'megavideo embed works'
);

is( $embeder->url_to_embed('http://www.megavideo.com/?c=6JACS1RB'), undef, 'invalid url');
is( $embeder->url_to_embed('http://www.megavideo.com'), undef, 'no video id');
is( $embeder->url_to_embed('http://www.m3gavideo.com/?v=6JACS1RB'), undef, 'm3gavideo, not megavideo');

done_testing;
