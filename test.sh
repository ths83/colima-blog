#!/bin/sh

if [[ $1 = "host" ]]; then
  echo "Testing Bind mount volume..."
elif [[ $1 = "volume" ]]; then
  echo "Testing Docker volume..."
else
  echo "Testing container..."
fi

for i in $(seq 3); do
  echo "Iteration $i"

  mkdir tmp

  echo "--- I/O testing ---"

  command time -f "write a 200 Mb file      -> {\"real\": %e, \"system\": %S, \"user\": %U}" dd if=/dev/zero of=./tmp/test.data bs=200M count=1

  command time -f "read a 200 Mb file       -> {\"real\": %e, \"system\": %S, \"user\": %U}" dd if=./tmp/test.data of=/dev/null bs=200M count=1

  command time -f "copy a 200 Mb file       -> {\"real\": %e, \"system\": %S, \"user\": %U}" cp ./tmp/test.data ./tmp/test_copy.data

  command time -f "write 10000 * 4 kB files -> {\"real\": %e, \"system\": %S, \"user\": %U}" sh scripts/small.sh >/dev/null

  command time -f "delete tmp folder        -> {\"real\": %e, \"system\": %S, \"user\": %U}" rm -rf ./tmp

  echo "--- End of I/O testing ---"

  echo "--- CPU load testing ---"

  command time -f "pow 3000 -> {\"real\": %e, \"system\": %S, \"user\": %U}" sh scripts/pow.sh >/dev/null

  echo "--- End of container testing ---"
done

rm -rf ./tmp

echo "--- End of script ---"
