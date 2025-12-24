# Dockerized Demo

Build a container with essential tools:

```bash
docker build -t intel-llvm-demokit .
docker run --rm -it -v $(pwd):/workspace intel-llvm-demokit bash -lc 'bash scripts/demo.sh'
```
