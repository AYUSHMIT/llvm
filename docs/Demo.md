# Intel LLVM DemoKit: IR-to-Object Pipeline

This demo showcases a full LLVM pipeline:

1. Compile C to LLVM IR (`clang -S -emit-llvm`)
2. Assemble IR to bitcode (`llvm-as`)
3. Analyze bitcode (`llvm-bcanalyzer`)
4. Optimize IR (`opt`, e.g., `-O3` or pass sets)
5. Generate assembly (`llc`)
6. Assemble to object (`llvm-mc`)
7. Link to executable (`ld.lld`)
8. Disassemble (`llvm-objdump`)

## Quick Start (Local)
Ensure `clang`, `opt`, `llc`, `llvm-as`, `llvm-dis`, `llvm-mc`, `llvm-objdump`, `ld.lld`, `llvm-bcanalyzer` are in PATH (build via CI workflow or locally).

```bash
bash scripts/demo.sh
```

Artifacts in `out/`:
- `sample.ll` / `sample.bc` / `sample.bc.dump.txt`
- `sample.opt.ll`
- `sample.s` / `sample.o` / `sample` (executable)
- `sample.disasm.txt` (objdump)

## CI
`.github/workflows/demo.yml` builds minimal tools with caching, runs the pipeline, and uploads artifacts.

## Targets
Default target is `x86_64-pc-linux-gnu`. You can set `TRIPLE` via environment for other targets (e.g., `aarch64-unknown-linux-gnu`).
