#!/bin/bash
cd ./output/cases || exit;
../../scripts/spin -run -DSAFETY  ./"$1";


