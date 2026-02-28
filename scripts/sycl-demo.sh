#!/usr/bin/env bash
set -euo pipefail
OUT_DIR="${OUT_DIR:-out}"
mkdir -p "${OUT_DIR}"

# Ensure tools exist
command -v clang++ >/dev/null || { echo "clang++ not found"; exit 1; }
command -v llvm-spirv >/dev/null || { echo "llvm-spirv not found (enable translator or install)"; exit 1; }

clang++ -fsycl -fsycl-device-only -S -emit-llvm samples/sycl/vec_add_sycl.cpp -o "${OUT_DIR}/sycl_device.ll"
llvm-spirv "${OUT_DIR}/sycl_device.ll" -o "${OUT_DIR}/sycl_device.spv" || {
  echo "llvm-spirv conversion failed"; exit 1;
}

if command -v spirv-dis >/dev/null; then
  spirv-dis "${OUT_DIR}/sycl_device.spv" > "${OUT_DIR}/sycl_device.spvasm"
fi

echo "SYCL device demo complete. Artifacts in ${OUT_DIR}"
