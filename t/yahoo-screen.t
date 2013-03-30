use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    class=> "video",
});

is( $embeder->url_to_embed('http://screen.yahoo.com/riding-monster-waves-with-garrett-mcnamara-30343361.html'),

    '<iframe frameborder="0" class="video" src="http://d.yimg.com/nl/vyc/site/player.html#browseCarouselUI=hide&startScreenCarouselUI=hide&vid=30343361&repeat=0"></iframe>',

    'yahoo-screen embed works'
);

is( $embeder->url_to_embed('http://screen.yahoo.com/riding-monster-waves-with-garrett-mcnamara-30343361html'), undef, 'invalid url');
is( $embeder->url_to_embed('http://screen.yahoo.com/riding-monster-waves-with-garrett-mcnamara-.html'), undef, 'no id');
is( $embeder->url_to_embed('http://screen.yah0o.com/riding-monster-waves-with-garrett-mcnamara-30343361.html'), undef, 'yah0o, not yahoo');

done_testing;
