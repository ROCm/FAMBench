#!/bin/bash

# Run all major benchmarks with tiny configs as an example
# Also used as a test script to make sure benchmarks run correctly.

# DLRM OOTB
./run_dlrm_ootb_infer.sh -l results
./run_dlrm_ootb_train.sh -l results # ootb configs use config files. See docs/DLRM.md

# DLRM UBench
./run_dlrm_ubench_train_linear.sh -c "[(2,2,2,2,2)]" -l results # Config not real
./run_dlrm_ubench_train_embeddingbag.sh -l results -c "[(2,2,2,2),(2,2,2,2),(2,2,2,2),(2,2,2,2),(2,2,2,2)]" # Config not real

# XLMR OOTB
./run_xlmr_ootb.sh

# CVT Convolutions UBench
./run_cvt_ubench_train_convs.sh -l result # The configurations (input shape, kernel size, etc.) benchmarked are taken from the CvT paper.

# view options: [raw_view -> pure json, intermediate_view -> nice table]
# intermediate view recommended for filling out table
python ../bmlogging/result_summarizer.py -f results -v intermediate_view
