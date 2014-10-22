use Test::More tests => 6;

use Forecast::IO;

my $lat      = 43.6667;
my $long     = -79.4167;
my $time     = 1373241600;
my $forecast = Forecast::IO->new(
    key       => '3f8d314e139bc4f3c4934803fdbf45d1',
    longitude => $long,
    latitude  => $lat,
    'time'    => $time
);

is( sprintf( "%.4f", $forecast->{latitude} ),  $lat );
is( sprintf( "%.4f", $forecast->{longitude} ), $long );
is( $forecast->{currently}->{'time'}, $time );
ok( exists( $forecast->{daily}->{data} ) );
ok( exists( $forecast->{hourly}->{data} ) );
ok( exists( $forecast->{currently}->{summary} ) );