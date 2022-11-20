#!/bin/sh

for j in $(seq 10000); do
  echo "hello world :)" >>./tmp/small_$j.txt
done
