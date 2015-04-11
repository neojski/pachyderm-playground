#!/bin/bash

# Where docker is running
HOST=localhost:650

# Upload book1 task
for file in data/*; do
  file=$(basename $file)
  curl -XPOST "$HOST/file/count_input/$file" -T "data/$file"
done

# Upload count job
curl -XPOST "$HOST/job/countMap"    -T job/countMap

curl -XPOST "$HOST/job/countReduce" -T job/countReduce

# Commit and run
curl -XPOST "$HOST/commit?run"
