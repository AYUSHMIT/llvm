# SYCL Device Pipeline (Optional)

This demo compiles a SYCL kernel to device LLVM IR and converts to SPIR-V:

```bash
# Device-only LLVM IR
clang++ -fsycl -fsycl-device-only -S -emit-llvm samples/sycl/vec_add_sycl.cpp -o out/sycl_device.ll

# Convert LLVM IR to SPIR-V (requires llvm-spirv)
llvm-spirv out/sycl_device.ll -o out/sycl_device.spv

# Optional: Disassemble with SPIRV-Tools (if available)
spirv-dis out/sycl_device.spv > out/sycl_device.spvasm
```

Artifacts: `out/sycl_device.ll`, `out/sycl_device.spv`, `out/sycl_device.spvasm` (optional).
