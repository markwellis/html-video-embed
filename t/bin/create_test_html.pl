use strict;
use warnings;
use HTML::Video::Embed;

my @urls = (qw|
    http://www.collegehumor.com/video/6879066/disney-princess-spring-breakers-trailer
    http://www.dailymotion.com/video/xy5ueq_action-women-derezzed-movie-montage_shortfilms
    http://www.ebaumsworld.com/video/watch/81510426/
    http://www.funnyordie.com/videos/1ab8850305/spook-hunters
    http://www.kontraband.com/videos/23299/I-Kissed-A-Nerd/
    http://www.liveleak.com/view?i=ffc_1272800490
    http://www.metacafe.com/watch/10099000/clumsy_penguins/
    http://vimeo.com/12279924
    http://screen.yahoo.com/riding-monster-waves-with-garrett-mcnamara-30343361.html
    http://www.youtu.be/xExSdzkZZB0
    http://www.youtube.com/watch?v=xExSdzkZZB0 
|);

my $embeder = HTML::Video::Embed->new({class=>"video"});

my @output;
foreach my $url ( @urls ){
    push( @output, $url );
    push( @output, $embeder->url_to_embed( $url ) );
}

print '<style type="text/css">.video{width:640px;height:480px}</style>' . join( '<br/>', @output ) . "\n";
