use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    'width' => 450,
    'height' => 370,
});

is( $embeder->url_to_embed('http://www.metacafe.com/watch/4515418/nuts_celebrity_mistaken_identity_craig_t_squirrel_cart/'),

    '<embed src="http://www.metacafe.com/fplayer/4515418/unimportant_info_i_hope.swf" width="450" '
        .'height="370" wmode="transparent" pluginspage="http://www.macromedia.com/go/getflashplayer" '
        .'type="application/x-shockwave-flash" allowFullScreen="true" name="Metacafe_4515418"></embed>',

    'metacafe embed works'
);

is( $embeder->url_to_embed('http://www.metacafe.com/watch/"£$sdf/nuts_celebrity_mistaken_identity_craig_t_squirrel_cart/'), undef, 'invalid url');
is( $embeder->url_to_embed('http://www.metacafe.com/watch//nuts_celebrity_mistaken_identity_craig_t_squirrel_cart/'), undef, 'no video id');
is( $embeder->url_to_embed('http://www.m3tacafe.com/watch/4515418/nuts_celebrity_mistaken_identity_craig_t_squirrel_cart/'), undef, 'm3tacafe, not metacafe');

done_testing;
