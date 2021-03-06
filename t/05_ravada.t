use warnings;
use strict;

use Test::More;
use Test::SQL::Data;

use_ok('Ravada');

ok(! $Ravada::CONNECTOR, "DB connector should be undef at load time");

my $test = Test::SQL::Data->new( config => 't/etc/sql.conf');
my $ravada = Ravada->new( connector => $test->connector
    , config => 't/etc/ravada.conf' 
    , warn_error => 0
);

ok($Ravada::CONNECTOR, "Now we should have a DB connector ");

ok($Ravada::CONNECTOR,"No connector defined ");
eval { ok($Ravada::CONNECTOR->dbh,"No dbh defined ") };

done_testing();
