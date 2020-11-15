#!/bin/bash
cd ./output/cases || exit;
../../scripts/spin -run -DSAFETY -reply ./"$1";


