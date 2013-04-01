use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    class=> "test-video",
});

is( 
    $embeder->url_to_embed('http://vimeo.com/12279924'),
    '<iframe class="test-video" src="http://player.vimeo.com/video/12279924" frameborder="0" allowFullScreen="1"></iframe>',
    'vimeo embed works'
);

is( $embeder->url_to_embed('http://vimeo.com/fhfhgfhgfh'), undef, 'invalid url');
is( $embeder->url_to_embed('http://vimeo.com/'), undef, 'no video id');
is( $embeder->url_to_embed('http://v1meo.com/12279924'), undef, 'domain check');

done_testing;
