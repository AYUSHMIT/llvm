# Optimization Playground

Experiment with LLVM optimization passes:

```bash
# Full O3
opt -S -O3 out/sample.ll -o out/sample.opt.ll

# Specific passes (new pass manager syntax)
opt -S -passes="mem2reg,sroa,constprop,inline" out/sample.ll -o out/sample.tuned.ll

# Print before/after for inspection
opt -S -passes="default<O3>" -print-before-all -print-after-all out/sample.ll -o /dev/null 2> out/opt_passes.log
```

Compare `out/sample.ll` vs `out/sample.opt.ll` and `out/sample.tuned.ll` to see IR simplifications, inlining, and loop unrolling.
