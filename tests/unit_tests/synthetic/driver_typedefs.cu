// RUN: %run_test hipify "%s" "%t" %hipify_args 1 --skip-excluded-preprocessor-conditional-blocks %clang_args -D__CUDA_API_VERSION_INTERNAL

// CHECK: #include <hip/hip_runtime.h>
#include <cuda.h>
#include <stdio.h>

int main() {
  printf("03. CUDA Driver API Typedefs synthetic test\n");

  // CHECK: hipDevice_t device;
  CUdevice device;
#if CUDA_VERSION > 11020
  // CHECK: hipDevice_t device_v1;
  CUdevice_v1 device_v1;
#endif

  // CHECK: hipDeviceptr_t deviceptr;
  // CHECK-NEXT: hipDeviceptr_t deviceptr_v1;
  CUdeviceptr deviceptr;
  CUdeviceptr_v1 deviceptr_v1;
#if CUDA_VERSION > 11020
  // CHECK: hipDeviceptr_t deviceptr_v2;
  CUdeviceptr_v2 deviceptr_v2;
#endif

#if CUDA_VERSION > 9020
  // CHECK: hipHostFn_t hostFn;
  CUhostFn hostFn;
#endif

  // CHECK: hipStreamCallback_t streamCallback;
  CUstreamCallback streamCallback;

  // CHECK: hipSurfaceObject_t surfObject;
  CUsurfObject surfObject;
#if CUDA_VERSION > 11020
  // CHECK: hipSurfaceObject_t surfObject_v1;
  CUsurfObject_v1 surfObject_v1;
#endif

  // CHECK: hipTextureObject_t texObject;
  CUtexObject texObject;
#if CUDA_VERSION > 11020
  // CHECK: hipTextureObject_t texObject_v1;
  CUtexObject_v1 texObject_v1;
#endif

  return 0;
}
