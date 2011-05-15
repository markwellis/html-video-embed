use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    'width' => 450,
    'height' => 370,
});

is( $embeder->url_to_embed('http://www.funnyordie.com/videos/1ab8850305/spook-hunters'),

    '<object width="450" height="370" id="ordie_player_1ab8850305"><param name="movie" value="http://player.ordienetworks.com/flash/fodplayer.swf" /><param name="flashvars" value="key=1ab8850305" /><param name="allowfullscreen" value="true" /><embed width="450" height="370" flashvars="key=1ab8850305" allowfullscreen="true" quality="high" src="http://player.ordienetworks.com/flash/fodplayer.swf" name="ordie_player_1ab8850305" type="application/x-shockwave-flash"></embed></object>',

    'funnyordie embed works'
);

is( $embeder->url_to_embed('http://www.funnyordie.com/video/1ab8850305/spook-hunters'), undef, 'invalid url');
is( $embeder->url_to_embed('http://www.funnyordie.com/videos//spook-hunters'), undef, 'no video id');
is( $embeder->url_to_embed('http://www.funny0rdie.com/videos/1ab8850305/spook-hunters'), undef, 'funny0rdie, not funnyordie');

done_testing;
