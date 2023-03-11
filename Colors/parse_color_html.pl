#!/usr/bin/perl

#   ./parse_color_html
#   paste -d ' ' color.txt hex.txt | tr '[:upper:]' '[:lower:]' 
use strict;

my $in;
my $out;
my $hexout;
my $name;
my $namecnt = 0;
my $hexcnt = 0;

open $in,  '<',  "color_names.html";
open $out, '>', "color.txt";
while (<$in>) {
    if ($_ =~ /colornamespan/) {
        $namecnt++;
        $name = $_;
        $name =~ s/<span*color=//;
        $name =~ s/.*color=//;
        $name =~ s/^.*"//;
        $name =~ s/^>//;

        $name =~ s/<.*>//;
        print $out $name;
    }
}
close $in;
close $out;
print "colors: ", $namecnt, "\n";


open $in,  '<',  "color_names.html";
open $out, '>', "hex.txt";

while (<$in>) {
    if ($_ =~ /colorhexspan/) {
        $hexcnt++;
        $name = $_;
        # print $name;
        $name =~ s/<div><span class="colorhexspan"><a target="_blank"//;

        $name =~ s/href.*hex=//;
        $name =~ s/^.*?>//;
        $name =~ s/<.*>//;

        print $out $name;
    }
}
close $in;
close $out;
print "hex: ", $hexcnt, "\n";
