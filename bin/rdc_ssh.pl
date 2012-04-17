#!/usr/bin/env perl
my $forwarder = 'sc';
print "Enter an RDC host name to connect to: "; 
$ssh = <STDIN>; 
print "\033]0;$ssh\007";
if($ssh eq $forwarder){
	system("ssh -A $forwarder");
}
else{
	system("ssh -A -t $forwarder ssh $ssh");
}
