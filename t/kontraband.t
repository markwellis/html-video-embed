use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    class => "video",
});

is( $embeder->url_to_embed('http://www.kontraband.com/videos/23299/I-Kissed-A-Nerd/'),

    '<embed class="video" flashvars="file=http://208.116.9.205/10/content/23299/450.flv" usefullscreen="true" allowfullscreen="true" quality="high" name="kbvideo" id="kbvideo" src="http://www.kontraband.com/show/4.5.swf" type="application/x-shockwave-flash"/>',

    'kontraband embed works'
);

is( $embeder->url_to_embed('http://www.kontraband.com/videos/fgh23299/I-Kissed-A-Nerd/'), undef, 'invalid url');
is( $embeder->url_to_embed('http://www.kontraband.com/videos/'), undef, 'no video id');
is( $embeder->url_to_embed('http://www.kuntraband.com/videos/23299/I-Kissed-A-Nerd/'), undef, 'kuntraband, not kontraband');

done_testing;
