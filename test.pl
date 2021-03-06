# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..23\n"; }
END {print "not ok 1\n" unless $loaded;}
use Perl6::Variables;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.


my $count=1;
sub ok {
	$count++;
	print "not " unless @_[0];
	print "ok $count\n";
}

my %hash = (a=>1, b=>2, z=>26, f=>{g=>5});
my @array = (0..10);
sub zee { 'z' }

my $arrayref = \@array;
my $hashref = \%hash;

ok ref \%hash eq 'HASH';
ok ref \@array eq 'ARRAY';
ok ref $hashref eq 'HASH';
ok ref $arrayref eq 'ARRAY';

# ok %hash{a} == 1;
ok %hash{zee} == 26;

ok @{[%hash{a=>'b'}]}==2;
ok @{[%hash{'a','b','z'}]}==3;
ok @{[%hash{qw(a z)}]}==2;
ok @{[%hash<<a z>>]}==2;

ok @array[1];
ok @array[1..3]==3;
ok @array[@array]==10;

# ok $hashref{a} == 1;
ok $hashref{zee} == 26;
ok @{[$hashref{a=>'b'}]}==2;
ok @{[$hashref{'a','b','z'}]}==3;
ok @{[$hashref.{qw(a z)}]}==2;
ok @{[$hashref<<a z>>]}==2;
ok @{[$hashref.<<a z>>]}==2;

ok $arrayref[1];
ok $arrayref[1..3]==3;
ok $arrayref.[@array]==10;

# print STDERR q{ %hash<<f>><<g>> \n};
# print STDERR q{ %hash{'f'}{'g'} \n};
ok q{ %hash<<f>><<g>> } eq q{ %hash{'f'}{'g'} };

