#!/bin/sh

for j in $(seq 3000); do
  echo "$j" ^ "$j" | bc
done
