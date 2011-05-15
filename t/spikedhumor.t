use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    'width' => 450,
    'height' => 370,
});

is( $embeder->url_to_embed('http://www.spikedhumor.com/articles/204009/Maher-You-Don-t-Care-About-the-Debt.html'),

    '<embed src="http://www.spikedhumor.com/player/vcplayer.swf?file=http://www.spikedhumor.com/videocodes/204009/data.xml&auto_play=false" quality="high" scale="noscale" bgcolor="#000000" width="450" height="370" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />',

    'spikedhumor embed works'
);

is( $embeder->url_to_embed('http://www.spikedhumor.com/watch/6420873'), undef, 'invalid url');
is( $embeder->url_to_embed('http://www.sp1kedhumor.com/articles//Maher-You-Don-t-Care-About-the-Debt.html'), undef, 'no video id');
is( $embeder->url_to_embed('http://www.sp1kedhumor.com/articles/204009/Maher-You-Don-t-Care-About-the-Debt.html'), undef, 'sp1kedhumor, not spikedhumor');

done_testing;
