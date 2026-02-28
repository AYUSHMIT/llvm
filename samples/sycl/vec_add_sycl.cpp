#include <CL/sycl.hpp>
using namespace sycl;

int main() {
  queue q;
  const size_t N = 1024;
  std::vector<float> A(N, 1.0f), B(N, 2.0f), C(N, 0.0f);

  {
    buffer<float> a_buf(A.data(), range<1>(N));
    buffer<float> b_buf(B.data(), range<1>(N));
    buffer<float> c_buf(C.data(), range<1>(N));
    q.submit([&](handler &h) {
      auto a = a_buf.get_access<access::mode::read>(h);
      auto b = b_buf.get_access<access::mode::read>(h);
      auto c = c_buf.get_access<access::mode::write>(h);
      h.parallel_for(range<1>(N), [=](id<1> i) {
        c[i] = a[i] + b[i];
      });
    }).wait();
  }
  return C[0] == 3.0f ? 0 : 1;
}
