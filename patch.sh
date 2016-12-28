#!/bin/sh

input="$1"
output="$2"
replacecmd='s/\x0f\x84\x0b\xfe\xff\xff/\x90\x90\x90\x90\x90\x90/'
if [ "$#" -ne 2 ]; then
  2>&1 echo "Usage: $0 <path to original libnvcuvid.so.xxx.yy> <destination for patched livnvcuvid.so.xxx.yy>"
  exit 2
fi
if [ "x$(realpath "$input")" = "x$(realpath "$output")" ] ; then
    sed -i.bak -e "$replacecmd" "$input"
else
    sed -e "$replacecmd" "$input" > "$output"
fi
