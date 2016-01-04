#!/usr/bin/perl

$file = $ARGV[0];
$file =~ s/\n//g;


if ($file eq ""){

	print "this script converts  svn tags between $___: and $ to nothingness, for file comparisons. \n";
	print "usage: svnclear.pl filename\n";

}else{

	&readfile($file);
	
	# Change $Revision: xxxxxx$ to just $Revision$ .... etc.
	$readfile =~ s/\$([A-Za-z]+): [^\$]*\$/\$\1\$/ig; 
    
	print "$readfile";

}

sub readfile(){
	open(INF,$_[0]) or die "Failed to open $_[0]\n";
	@readfile = <INF>;
	close(INF);
	
	foreach $ln (@readfile) {
		$readfile = "$readfile$ln";
	}
}
