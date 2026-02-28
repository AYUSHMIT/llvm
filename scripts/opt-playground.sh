#!/usr/bin/env bash
set -euo pipefail
OUT_DIR="${OUT_DIR:-out}"
mkdir -p "${OUT_DIR}"

opt -S -O3 "${OUT_DIR}/sample.ll" -o "${OUT_DIR}/sample.opt.ll"
opt -S -passes="mem2reg,sroa,constprop,inline" "${OUT_DIR}/sample.ll" -o "${OUT_DIR}/sample.tuned.ll"
opt -S -passes="default<O3>" -print-before-all -print-after-all "${OUT_DIR}/sample.ll" -o /dev/null 2> "${OUT_DIR}/opt_passes.log"

echo "Optimization playground complete. See ${OUT_DIR}/ for results."
