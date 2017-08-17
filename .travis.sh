#!/bin/bash

set -e
set -x

for source in ./*/*.d
do
    dub run -b unittest --compiler=$DC --single $source
    dub build -b debug --compiler=$DC --single $source
    dub build -b release --compiler=$DC --single $source
done
