#!/usr/bin/perl -w
my $head = "";
opendir(DIR, "$ARGV[0]") or die "can't open $ARGV[0]: $!\n";
open(OUT, ">$ARGV[1]") or die "can't open $ARGV[1] :$!\n";
my @files = readdir(DIR);
for my $file(@files){
	next unless $file =~ /^T/;
	my $filepath = $ARGV[0].$file;
	open(FILE, $filepath) or die "can't open $file: $!\n";
	while(my $line = <FILE>){
		if($line =~ /^Hugo_Symbol/){
			if(!$head){
				$head = $line;
				print OUT $head;
			}else{
				next;
			}
		}else{
			print OUT $line;
		}
		
	}
	close(FILE);
}
close(OUT);
close(DIR); 
