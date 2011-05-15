use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    'width' => 450,
    'height' => 370,
});

is( $embeder->url_to_embed('http://uk.video.yahoo.com/watch/6421277/16650873'),

    '<object width="450" height="370"><param name="movie" value="http://d.yimg.com/static.video.yahoo.com/yep/YV_YEP.swf?ver=2.2.46" /><param name="allowFullScreen" value="true" /><param name="bgcolor" value="#000000" /><param name="flashVars" value="id=16650873&vid=6421277&lang=en-gb&intl=uk&embed=1" /><embed src="http://d.yimg.com/static.video.yahoo.com/yep/YV_YEP.swf?ver=2.2.46" type="application/x-shockwave-flash" width="450" height="370" allowFullScreen="true" bgcolor="#000000" flashVars="id=16650873&vid=6421277&lang=en-gb&intl=uk&embed=1" ></embed></object>',

    'yahoo embed works'
);

is( $embeder->url_to_embed('http://uk.video.yahoo.com/watch/6420873'), undef, 'invalid url');
is( $embeder->url_to_embed('http://uk.video.yahoo.com/watch//16650873'), undef, 'no seg 1');
is( $embeder->url_to_embed('http://uk.video.yah0o.com/watch/6421277/16650873'), undef, 'yah0o, not yahoo');

done_testing;
