use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    class=> "test-video",
});

is( 
    $embeder->url_to_embed('http://screen.yahoo.com/riding-monster-waves-with-garrett-mcnamara-30343361.html'),
    '<iframe class="test-video" src="http://d.yimg.com/nl/vyc/site/player.html#browseCarouselUI=hide&startScreenCarouselUI=hide&vid=30343361&repeat=0" frameborder="0" allowfullscreen="1"></iframe>',
    'yahoo-screen embed works'
);

is( $embeder->url_to_embed('http://screen.yahoo.com/riding-monster-waves-with-garrett-mcnamara-30343361html'), undef, 'invalid url');
is( $embeder->url_to_embed('http://screen.yahoo.com/riding-monster-waves-with-garrett-mcnamara-.html'), undef, 'no id');
is( $embeder->url_to_embed('http://screen.yah0o.com/riding-monster-waves-with-garrett-mcnamara-30343361.html'), undef, 'domain check');

done_testing;
