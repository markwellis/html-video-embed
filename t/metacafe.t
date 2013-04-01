use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    class => "test-video",
});

is( 
    $embeder->url_to_embed('http://www.metacafe.com/watch/10099000/clumsy_penguins/'),
    '<embed flashVars="playerVars=autoPlay=no" src="http://www.metacafe.com/fplayer/10099000/clumsy_penguins.swf" class="test-video" wmode="transparent" allowFullScreen="true" type="application/x-shockwave-flash"></embed>',
    'metacafe embed works'
);

is( $embeder->url_to_embed('http://www.metacafe.com/watch/"£$sdf/nuts_celebrity_mistaken_identity_craig_t_squirrel_cart/'), undef, 'invalid url');
is( $embeder->url_to_embed('http://www.metacafe.com/watch//nuts_celebrity_mistaken_identity_craig_t_squirrel_cart/'), undef, 'no video id');
is( $embeder->url_to_embed('http://www.m3tacafe.com/watch/4515418/nuts_celebrity_mistaken_identity_craig_t_squirrel_cart/'), undef, 'domain check');

done_testing;
