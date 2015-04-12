#!/bin/bash

# Where pachyderm is running
HOST=localhost:650

# Upload all input files from data directory into count_input directory
for file in data/*; do
  file=$(basename $file)
  curl -XPOST "$HOST/file/count_input/$file" -T "data/$file"
done

# Upload map job. Its input is defined as count_input directory so it'll process
# all files from that directory using neojski/pachyderm-count-map docker image
# and its /bin/map command (see job/countMap job definition).
curl -XPOST "$HOST/job/countMap"    -T job/countMap

# Upload reduce job. It takes job/countMap as its input so it'll process all the
# files generated by the map job and reduce them into a single value.
curl -XPOST "$HOST/job/countReduce" -T job/countReduce

# Commit and run. Please refer to pachyderm as where to find output. At the time
# of writing it was located by default in: ~/.pfs/vol/comp-0-1/[job id]
# directory.
curl -XPOST "$HOST/commit?run"
