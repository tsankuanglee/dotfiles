#!/usr/bin/perl

# A jq wrapper for simple json-based key-value storage

use strict;

if (scalar @ARGV != 2) {
    die "Usage: $ARGV[0] filename.json a=5|a\n";
}

# parse args
my ($filename, $kv_or_k) = @ARGV;
my $k;
my $v;
my $mode = "read";

if ($kv_or_k =~ /^([^=]+)=([^=]+)$/) {
    # kv
    ($k, $v) = ($1, $2);
    $mode = "write";
} else {
    $k = $kv_or_k;
}

# ensure file not empty
if (! -e $filename || -z $filename) {
    `echo -n "{}" > "$filename"`;
}


# call jq

my $cmd = "jq '.$kv_or_k' \"$filename\" ";
# if it's a write
if ($kv_or_k =~ /^([^=]+)=([^=]+)$/) {
    $cmd = $cmd . " | /usr/bin/sponge \"$filename\" ";
}

# remove quotes
my $result = `$cmd`;
$result =~ s/^"//g;
$result =~ s/"$//g;

print $result;
