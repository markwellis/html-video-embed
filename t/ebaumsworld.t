use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    "class" => "video",
});

is( $embeder->url_to_embed('http://www.ebaumsworld.com/video/watch/81510426/'),
    '<embed src="http://www.ebaumsworld.com/player.swf" allowScriptAccess="always" flashvars="id1=81510426" wmode="transparent" class="video" allowfullscreen="true" />',
    'ebaumsworld embed works'
);

is( $embeder->url_to_embed('http://www.ebaumsworld.com/video/watch/wibble/'), undef, 'invalid video');
is( $embeder->url_to_embed('http://www.ebaumsworld.com/video/watch/'), undef, 'no video');
is( $embeder->url_to_embed('http://www.eboumsworld.com/video/watch/81510426/'), undef, 'eboumsworld, not ebaumsworld');

done_testing;
