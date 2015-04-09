#!/bin/bash

# Where docker is running
HOST=localhost:650

# Upload book1 task
curl -XPOST "$HOST/file/count_input/book1.txt" -T data/book1.txt

# Upload count job
curl -XPOST "$HOST/job/countMap"    -T job/countMap

curl -XPOST "$HOST/job/countReduce" -T job/countReduce

# Commit and run
curl -XPOST "$HOST/commit?run"
