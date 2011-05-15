use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    'width' => 450,
    'height' => 370,
});

is( $embeder->url_to_embed('http://vimeo.com/12279924'),

    '<object width="450" height="370"><param name="allowfullscreen" value="true" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=12279924&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" /><embed src="http://vimeo.com/moogaloop.swf?clip_id=12279924&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" width="450" height="370"></embed></object>',

    'vimeo embed works'
);

is( $embeder->url_to_embed('http://vimeo.com/fhfhgfhgfh'), undef, 'invalid url');
is( $embeder->url_to_embed('http://vimeo.com/'), undef, 'no video id');
is( $embeder->url_to_embed('http://v1meo.com/12279924'), undef, 'v1meo, not vimeo');

done_testing;
