//
// parrot_optimizer_animated.cu
//
// Code generation for function 'parrot_optimizer_animated'
//

// Include files
#include "parrot_optimizer_animated.h"
#include "eml_mtimes_helper.h"
#include "parrot_optimizer_animated_data.h"
#include "parrot_optimizer_animated_emxutil.h"
#include "parrot_optimizer_animated_types.h"
#include "rt_nonfinite.h"
#include "MWCudaDimUtility.hpp"
#include "MWCudaMemoryFunctions.hpp"
#include "MWLaunchParametersUtilities.hpp"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include <cmath>
#include <cstring>

// Variable Definitions
static emlrtRTEInfo emlrtRTEI{
    103,                                                            // lineNo
    24,                                                             // colNo
    "rand",                                                         // fName
    "D:\\Matlab\\fulll\\toolbox\\eml\\lib\\matlab\\randfun\\rand.m" // pName
};

static emlrtRTEInfo b_emlrtRTEI{
    3,                           // lineNo
    5,                           // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo c_emlrtRTEI{
    4,                           // lineNo
    15,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo d_emlrtRTEI{
    6,                           // lineNo
    5,                           // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo e_emlrtRTEI{
    10,                          // lineNo
    25,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo f_emlrtRTEI{
    7,                           // lineNo
    35,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo g_emlrtRTEI{
    181,                     // lineNo
    24,                      // colNo
    "combineVectorElements", // fName
    "D:"
    "\\Matlab\\fulll\\toolbox\\eml\\lib\\matlab\\datafun\\private\\combineVecto"
    "rElements.m" // pName
};

static emlrtRTEInfo h_emlrtRTEI{
    108,                     // lineNo
    13,                      // colNo
    "combineVectorElements", // fName
    "D:"
    "\\Matlab\\fulll\\toolbox\\eml\\lib\\matlab\\datafun\\private\\combineVecto"
    "rElements.m" // pName
};

static emlrtRTEInfo i_emlrtRTEI{
    14,                          // lineNo
    9,                           // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo j_emlrtRTEI{
    15,                          // lineNo
    9,                           // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo k_emlrtRTEI{
    139,                                                             // lineNo
    20,                                                              // colNo
    "randn",                                                         // fName
    "D:\\Matlab\\fulll\\toolbox\\eml\\lib\\matlab\\randfun\\randn.m" // pName
};

static emlrtRTEInfo l_emlrtRTEI{
    75,                          // lineNo
    13,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo m_emlrtRTEI{
    57,                          // lineNo
    17,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo o_emlrtRTEI{
    30,                    // lineNo
    21,                    // colNo
    "applyScalarFunction", // fName
    "D:\\Matlab\\fulll\\toolbox\\eml\\eml\\+coder\\+"
    "internal\\applyScalarFunction.m" // pName
};

static emlrtRTEInfo p_emlrtRTEI{
    129,                         // lineNo
    6,                           // colNo
    "applyBinaryScalarFunction", // fName
    "D:\\Matlab\\fulll\\toolbox\\eml\\eml\\+coder\\+"
    "internal\\applyBinaryScalarFunction.m" // pName
};

static emlrtRTEInfo
    q_emlrtRTEI{
        34,               // lineNo
        1,                // colNo
        "rdivide_helper", // fName
        "D:\\Matlab\\fulll\\toolbox\\eml\\eml\\+coder\\+internal\\rdivide_"
        "helper.m" // pName
    };

static emlrtRTEInfo r_emlrtRTEI{
    40,                          // lineNo
    17,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo s_emlrtRTEI{
    30,                          // lineNo
    17,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo t_emlrtRTEI{
    49,                          // lineNo
    21,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo u_emlrtRTEI{
    3,                // lineNo
    9,                // colNo
    "initialization", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\initialization.m" // pName
};

static emlrtRTEInfo v_emlrtRTEI{
    4,                           // lineNo
    5,                           // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo w_emlrtRTEI{
    49,                                                             // lineNo
    9,                                                              // colNo
    "mean",                                                         // fName
    "D:\\Matlab\\fulll\\toolbox\\eml\\lib\\matlab\\datafun\\mean.m" // pName
};

static emlrtRTEInfo x_emlrtRTEI{
    13,        // lineNo
    1,         // colNo
    "normrnd", // fName
    "D:\\Matlab\\fulll\\toolbox\\eml\\eml\\+coder\\+internal\\private\\normrnd."
    "m" // pName
};

static emlrtRTEInfo y_emlrtRTEI{
    48,                          // lineNo
    36,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo ab_emlrtRTEI{
    26,                          // lineNo
    17,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo bb_emlrtRTEI{
    48,                          // lineNo
    60,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo cb_emlrtRTEI{
    38,                          // lineNo
    28,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo db_emlrtRTEI{
    27,                          // lineNo
    28,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo eb_emlrtRTEI{
    48,                          // lineNo
    30,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo fb_emlrtRTEI{
    61,                          // lineNo
    25,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

static emlrtRTEInfo gb_emlrtRTEI{
    40,                          // lineNo
    25,                          // colNo
    "parrot_optimizer_animated", // fName
    "D:\\GIT_resp\\Optimization-Algorithms\\po\\function\\parrot_optimizer_"
    "animated.m" // pName
};

// Function Declarations
static void binary_expand_op(emxArray_real_T *in1, const emxArray_real_T *in2,
                             int32_T in3, const emxArray_real_T *in4,
                             const emxArray_real_T *in5,
                             const emxArray_real_T *in6, real_T in7,
                             const emxArray_real_T *in8);

static void binary_expand_op_1(emxArray_real_T *in1, const emxArray_real_T *in2,
                               int32_T in3, const emxArray_real_T *in4,
                               const emxArray_real_T *in5,
                               const emxArray_real_T *in6,
                               const emxArray_real_T *in7);

static void binary_expand_op_3(emxArray_real_T *in1, const emxArray_real_T *in2,
                               int32_T in3, const emxArray_real_T *in4,
                               const emxArray_real_T *in5);

static void binary_expand_op_4(emxArray_real_T *in1, const emxArray_real_T *in2,
                               int32_T in3, real_T in4,
                               const emxArray_real_T *in5, real_T in6);

static __global__ void c_parrot_optimizer_animated_ker(const real_T lb,
                                                       const real_T St,
                                                       const emxArray_real_T r,
                                                       const int32_T b_r,
                                                       emxArray_real_T X);

static void checkCudaError(cudaError_t errCode, const char_T *file,
                           uint32_T b_line);

static uint64_T computeNumIters(int32_T ub);

static __global__ void d_parrot_optimizer_animated_ker(const emxArray_real_T X,
                                                       const int32_T b,
                                                       emxArray_real_T fitness,
                                                       int32_T X_dim0);

static __global__ void e_parrot_optimizer_animated_ker(const emxArray_real_T X,
                                                       const int32_T npages,
                                                       const int32_T b_X,
                                                       emxArray_real_T X_best,
                                                       int32_T X_dim0);

static __global__ void f_parrot_optimizer_animated_ker(const int32_T sz,
                                                       emxArray_real_T y);

static __global__ void g_parrot_optimizer_animated_ker(const int32_T npages,
                                                       const emxArray_real_T y,
                                                       const int32_T b_y,
                                                       emxArray_real_T X_mean);

static void gpuEmxEnsureCapacity_real_T(const emxArray_real_T *cpu,
                                        emxArray_real_T *gpu,
                                        boolean_T needsCopy);

static void gpuEmxFree_real_T(emxArray_real_T *gpu);

static void gpuEmxMemcpyCpuToGpu_real_T(emxArray_real_T *gpu,
                                        const emxArray_real_T *cpu);

static void gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T *cpu,
                                        emxArray_real_T *gpu);

static void gpuEmxReset_real_T(emxArray_real_T *gpu);

static __global__ void h_parrot_optimizer_animated_ker(const emxArray_real_T v,
                                                       const int32_T b,
                                                       emxArray_real_T y);

static __global__ void i_parrot_optimizer_animated_ker(const emxArray_real_T y,
                                                       const int32_T b,
                                                       emxArray_real_T b_y);

static __global__ void j_parrot_optimizer_animated_ker(
    const emxArray_real_T X_mean, const real_T t2, const emxArray_real_T y,
    const emxArray_real_T r, const emxArray_real_T X_best,
    const emxArray_real_T X, const int32_T i, const int32_T b_X,
    emxArray_real_T X_new, int32_T X_dim0);

static __global__ void
k_parrot_optimizer_animated_ker(const real_T lb, const emxArray_real_T X_new,
                                const int32_T b, emxArray_real_T maxval);

static __global__ void
l_parrot_optimizer_animated_ker(const real_T ub, const emxArray_real_T maxval,
                                const int32_T b, emxArray_real_T X_new);

static __global__ void
m_parrot_optimizer_animated_ker(const emxArray_real_T X_new, const int32_T i,
                                const int32_T b, emxArray_real_T X,
                                int32_T X_dim0);

static __global__ void n_parrot_optimizer_animated_ker(const emxArray_real_T v,
                                                       const int32_T b,
                                                       emxArray_real_T y);

static __global__ void o_parrot_optimizer_animated_ker(const emxArray_real_T y,
                                                       const int32_T b,
                                                       emxArray_real_T b_y);

static __global__ void p_parrot_optimizer_animated_ker(
    const emxArray_real_T dv5, const emxArray_real_T y, const emxArray_real_T r,
    const emxArray_real_T X_best, const emxArray_real_T X, const int32_T i,
    const int32_T b_X, emxArray_real_T X_new, int32_T X_dim0);

static __global__ void q_parrot_optimizer_animated_ker(
    const emxArray_real_T X_mean, const emxArray_real_T X, const int32_T i,
    const real_T t2, const int32_T b_X, emxArray_real_T X_new, int32_T X_dim0);

static __global__ void r_parrot_optimizer_animated_ker(const real_T Max_iter,
                                                       const emxArray_real_T r,
                                                       const int32_T npages,
                                                       const int32_T b_r,
                                                       emxArray_real_T dv4);

static void raiseCudaError(int32_T errCode, const char_T *file, uint32_T b_line,
                           const char_T *errorName, const char_T *errorString);

static real_T rt_powd_snf(real_T u0, real_T u1);

static __global__ void s_parrot_optimizer_animated_ker(const int32_T b,
                                                       emxArray_real_T dv4);

static __global__ void t_parrot_optimizer_animated_ker(
    const emxArray_real_T dv4, const emxArray_real_T r, const emxArray_real_T X,
    const int32_T i, const int32_T b_X, emxArray_real_T X_new, int32_T X_dim0);

static __global__ void
u_parrot_optimizer_animated_ker(const real_T St, const real_T t2,
                                const emxArray_real_T X, const int32_T i,
                                const emxArray_real_T X_best, const int32_T b_X,
                                emxArray_real_T X_new, int32_T X_dim0);

static __global__ void v_parrot_optimizer_animated_ker(const emxArray_real_T X,
                                                       const int32_T npages,
                                                       const int32_T b_X,
                                                       emxArray_real_T X_best,
                                                       int32_T X_dim0);

static __global__ void w_parrot_optimizer_animated_ker(const int32_T vlen,
                                                       const emxArray_real_T X,
                                                       const int32_T b,
                                                       emxArray_real_T y,
                                                       int32_T X_dim0);

// Function Definitions
static void binary_expand_op(emxArray_real_T *in1, const emxArray_real_T *in2,
                             int32_T in3, const emxArray_real_T *in4,
                             const emxArray_real_T *in5,
                             const emxArray_real_T *in6, real_T in7,
                             const emxArray_real_T *in8)
{
  int32_T b;
  int32_T i;
  int32_T stride_0_1;
  int32_T stride_1_1;
  int32_T stride_2_1;
  int32_T stride_3_1;
  int32_T stride_4_1;
  i = in1->size[0] * in1->size[1];
  in1->size[0] = 1;
  if (in8->size[1] == 1) {
    if (in6->size[1] == 1) {
      b = in5->size[1];
    } else {
      b = in6->size[1];
    }
    if (b == 1) {
      if (in4->size[1] == 1) {
        in1->size[1] = in2->size[1];
      } else {
        in1->size[1] = in4->size[1];
      }
    } else if (in6->size[1] == 1) {
      in1->size[1] = in5->size[1];
    } else {
      in1->size[1] = in6->size[1];
    }
  } else {
    in1->size[1] = in8->size[1];
  }
  emxEnsureCapacity_real_T(in1, i, &s_emlrtRTEI);
  stride_0_1 = (in2->size[1] != 1);
  stride_1_1 = (in4->size[1] != 1);
  stride_2_1 = (in5->size[1] != 1);
  stride_3_1 = (in6->size[1] != 1);
  stride_4_1 = (in8->size[1] != 1);
  if (in6->size[1] == 1) {
    b = in5->size[1];
  } else {
    b = in6->size[1];
  }
  if (in8->size[1] == 1) {
    if (b == 1) {
      if (in4->size[1] == 1) {
        b = in2->size[1];
      } else {
        b = in4->size[1];
      }
    } else if (in6->size[1] == 1) {
      b = in5->size[1];
    } else {
      b = in6->size[1];
    }
  } else {
    b = in8->size[1];
  }
  for (i = 0; i < b; i++) {
    in1->data[i] = (in2->data[in3 + in2->size[0] * (i * stride_0_1)] -
                    in4->data[i * stride_1_1]) *
                       (in5->data[i * stride_2_1] * 0.69657450255769682 /
                        in6->data[i * stride_3_1]) +
                   in7 * in8->data[i * stride_4_1];
  }
}

static void binary_expand_op_1(emxArray_real_T *in1, const emxArray_real_T *in2,
                               int32_T in3, const emxArray_real_T *in4,
                               const emxArray_real_T *in5,
                               const emxArray_real_T *in6,
                               const emxArray_real_T *in7)
{
  int32_T b;
  int32_T i;
  int32_T stride_0_1;
  int32_T stride_1_1;
  int32_T stride_2_1;
  int32_T stride_3_1;
  int32_T stride_4_1;
  i = in1->size[0] * in1->size[1];
  in1->size[0] = 1;
  if (in7->size[1] == 1) {
    if (in6->size[1] == 1) {
      b = in5->size[1];
    } else {
      b = in6->size[1];
    }
    if (b == 1) {
      b = in4->size[1];
    } else if (in6->size[1] == 1) {
      b = in5->size[1];
    } else {
      b = in6->size[1];
    }
    if (b == 1) {
      in1->size[1] = in2->size[1];
    } else {
      if (in6->size[1] == 1) {
        b = in5->size[1];
      } else {
        b = in6->size[1];
      }
      if (b == 1) {
        in1->size[1] = in4->size[1];
      } else if (in6->size[1] == 1) {
        in1->size[1] = in5->size[1];
      } else {
        in1->size[1] = in6->size[1];
      }
    }
  } else {
    in1->size[1] = in7->size[1];
  }
  emxEnsureCapacity_real_T(in1, i, &r_emlrtRTEI);
  stride_0_1 = (in2->size[1] != 1);
  stride_1_1 = (in4->size[1] != 1);
  stride_2_1 = (in5->size[1] != 1);
  stride_3_1 = (in6->size[1] != 1);
  stride_4_1 = (in7->size[1] != 1);
  if (in6->size[1] == 1) {
    b = in5->size[1];
  } else {
    b = in6->size[1];
  }
  if (b == 1) {
    b = in4->size[1];
  } else if (in6->size[1] == 1) {
    b = in5->size[1];
  } else {
    b = in6->size[1];
  }
  if (in6->size[1] == 1) {
    i = in5->size[1];
  } else {
    i = in6->size[1];
  }
  if (in7->size[1] == 1) {
    if (b == 1) {
      b = in2->size[1];
    } else if (i == 1) {
      b = in4->size[1];
    } else if (in6->size[1] == 1) {
      b = in5->size[1];
    } else {
      b = in6->size[1];
    }
  } else {
    b = in7->size[1];
  }
  for (i = 0; i < b; i++) {
    in1->data[i] = (in2->data[in3 + in2->size[0] * (i * stride_0_1)] +
                    in4->data[i * stride_1_1] *
                        (in5->data[i * stride_2_1] * 0.69657450255769682 /
                         in6->data[i * stride_3_1])) +
                   in7->data[i * stride_4_1];
  }
}

static void binary_expand_op_3(emxArray_real_T *in1, const emxArray_real_T *in2,
                               int32_T in3, const emxArray_real_T *in4,
                               const emxArray_real_T *in5)
{
  int32_T b;
  int32_T i;
  int32_T stride_0_1;
  int32_T stride_1_1;
  int32_T stride_2_1;
  i = in1->size[0] * in1->size[1];
  in1->size[0] = 1;
  if (in5->size[1] == 1) {
    b = in4->size[1];
  } else {
    b = in5->size[1];
  }
  if (b == 1) {
    in1->size[1] = in2->size[1];
  } else if (in5->size[1] == 1) {
    in1->size[1] = in4->size[1];
  } else {
    in1->size[1] = in5->size[1];
  }
  emxEnsureCapacity_real_T(in1, i, &t_emlrtRTEI);
  stride_0_1 = (in2->size[1] != 1);
  stride_1_1 = (in4->size[1] != 1);
  stride_2_1 = (in5->size[1] != 1);
  if (in5->size[1] == 1) {
    b = in4->size[1];
  } else {
    b = in5->size[1];
  }
  if (b == 1) {
    b = in2->size[1];
  } else if (in5->size[1] == 1) {
    b = in4->size[1];
  } else {
    b = in5->size[1];
  }
  for (i = 0; i < b; i++) {
    in1->data[i] = in2->data[in3 + in2->size[0] * (i * stride_0_1)] +
                   0.2 * in4->data[i * stride_1_1] * in5->data[i * stride_2_1];
  }
}

static void binary_expand_op_4(emxArray_real_T *in1, const emxArray_real_T *in2,
                               int32_T in3, real_T in4,
                               const emxArray_real_T *in5, real_T in6)
{
  int32_T b;
  int32_T i;
  int32_T stride_0_1;
  int32_T stride_1_1;
  int32_T stride_2_1;
  int32_T stride_3_1;
  int32_T stride_4_1;
  i = in1->size[0] * in1->size[1];
  in1->size[0] = 1;
  if (in5->size[1] == 1) {
    b = in2->size[1];
  } else {
    b = in5->size[1];
  }
  if (b == 1) {
    if (in2->size[1] == 1) {
      b = in5->size[1];
    } else {
      b = in2->size[1];
    }
    if (b == 1) {
      in1->size[1] = in2->size[1];
    } else if (in2->size[1] == 1) {
      in1->size[1] = in5->size[1];
    } else {
      in1->size[1] = in2->size[1];
    }
  } else if (in5->size[1] == 1) {
    in1->size[1] = in2->size[1];
  } else {
    in1->size[1] = in5->size[1];
  }
  emxEnsureCapacity_real_T(in1, i, &m_emlrtRTEI);
  stride_0_1 = (in2->size[1] != 1);
  stride_1_1 = (in5->size[1] != 1);
  stride_2_1 = (in2->size[1] != 1);
  stride_3_1 = (in2->size[1] != 1);
  stride_4_1 = (in5->size[1] != 1);
  if (in5->size[1] == 1) {
    b = in2->size[1];
  } else {
    b = in5->size[1];
  }
  if (in2->size[1] == 1) {
    i = in5->size[1];
  } else {
    i = in2->size[1];
  }
  if (b == 1) {
    if (i == 1) {
      b = in2->size[1];
    } else if (in2->size[1] == 1) {
      b = in5->size[1];
    } else {
      b = in2->size[1];
    }
  } else if (in5->size[1] == 1) {
    b = in2->size[1];
  } else {
    b = in5->size[1];
  }
  for (i = 0; i < b; i++) {
    in1->data[i] = (in2->data[in3 + in2->size[0] * (i * stride_0_1)] +
                    in4 * (in5->data[i * stride_1_1] -
                           in2->data[in3 + in2->size[0] * (i * stride_2_1)])) -
                   in6 * (in2->data[in3 + in2->size[0] * (i * stride_3_1)] -
                          in5->data[i * stride_4_1]);
  }
}

static __global__
    __launch_bounds__(1024, 1) void c_parrot_optimizer_animated_ker(
        const real_T lb, const real_T St, const emxArray_real_T r,
        const int32_T b_r, emxArray_real_T X)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_r);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    X.data[xpageoffset] = r.data[xpageoffset] * St + lb;
  }
}

static void checkCudaError(cudaError_t errCode, const char_T *file,
                           uint32_T b_line)
{
  if (errCode != cudaSuccess) {
    raiseCudaError(errCode, file, b_line, cudaGetErrorName(errCode),
                   cudaGetErrorString(errCode));
  }
}

static uint64_T computeNumIters(int32_T ub)
{
  uint64_T numIters;
  numIters = 0ULL;
  if (ub >= 0) {
    numIters = static_cast<uint64_T>(ub + 1);
  }
  return numIters;
}

static __global__ __launch_bounds__(
    1024, 1) void d_parrot_optimizer_animated_ker(const emxArray_real_T X,
                                                  const int32_T b,
                                                  emxArray_real_T fitness,
                                                  int32_T X_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    real_T d;
    real_T d1;
    real_T t1;
    real_T t2;
    int32_T k;
    k = static_cast<int32_T>(idx);
    t1 = 0.0;
    t2 = 0.0;
    d = X.data[k];
    d1 = X.data[k + X_dim0];
    for (int32_T i{0}; i < 5; i++) {
      t1 += (static_cast<real_T>(i) + 1.0) *
            cos(((static_cast<real_T>(i) + 1.0) + 1.0) * d +
                (static_cast<real_T>(i) + 1.0));
      t2 += (static_cast<real_T>(i) + 1.0) *
            cos(((static_cast<real_T>(i) + 1.0) + 1.0) * d1 +
                (static_cast<real_T>(i) + 1.0));
    }
    fitness.data[k] = t1 * t2;
  }
}

static __global__
    __launch_bounds__(1024, 1) void e_parrot_optimizer_animated_ker(
        const emxArray_real_T X, const int32_T npages, const int32_T b_X,
        emxArray_real_T X_best, int32_T X_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_X);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    X_best.data[xpageoffset] = X.data[npages + X_dim0 * xpageoffset];
  }
}

static __global__
    __launch_bounds__(1024,
                      1) void f_parrot_optimizer_animated_ker(const int32_T sz,
                                                              emxArray_real_T y)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(sz);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    y.data[xpageoffset] = 0.0;
  }
}

static __global__ __launch_bounds__(
    1024, 1) void g_parrot_optimizer_animated_ker(const int32_T npages,
                                                  const emxArray_real_T y,
                                                  const int32_T b_y,
                                                  emxArray_real_T X_mean)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_y);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    X_mean.data[xpageoffset] =
        y.data[xpageoffset] / static_cast<real_T>(npages);
  }
}

static void gpuEmxEnsureCapacity_real_T(const emxArray_real_T *cpu,
                                        emxArray_real_T *gpu,
                                        boolean_T needsCopy)
{
  real_T *newData;
  int32_T i;
  int32_T totalSizeCpu;
  int32_T totalSizeGpu;
  if (gpu->numDimensions == 0) {
    gpu->numDimensions = cpu->numDimensions;
    gpu->size = static_cast<int32_T *>(emlrtCallocMex(
        static_cast<uint32_T>(gpu->numDimensions), sizeof(int32_T)));
  }
  totalSizeCpu = 1;
  totalSizeGpu = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    totalSizeGpu *= gpu->size[i];
    totalSizeCpu *= cpu->size[i];
    gpu->size[i] = cpu->size[i];
  }
  if (gpu->allocatedSize < totalSizeCpu) {
    i = cpu->allocatedSize;
    if (i < totalSizeCpu) {
      i = totalSizeCpu;
    }
    checkCudaError(
        mwCudaMalloc(&newData, static_cast<uint32_T>(i) * sizeof(real_T)),
        __FILE__, __LINE__);
    needsCopy = (needsCopy && gpu->canFreeData);
    if (needsCopy) {
      checkCudaError(
          cudaMemcpy(newData, gpu->data,
                     static_cast<uint32_T>(totalSizeGpu) * sizeof(real_T),
                     cudaMemcpyDeviceToDevice),
          __FILE__, __LINE__);
    }
    if (gpu->canFreeData) {
      checkCudaError(mwCudaFree(gpu->data), __FILE__, __LINE__);
    }
    gpu->data = newData;
    gpu->allocatedSize = i;
    gpu->canFreeData = true;
  }
}

static void gpuEmxFree_real_T(emxArray_real_T *gpu)
{
  if (gpu->data != (void *)4207599121ULL) {
    checkCudaError(mwCudaFree(gpu->data), __FILE__, __LINE__);
  }
  emlrtFreeMex(gpu->size);
}

static void gpuEmxMemcpyCpuToGpu_real_T(emxArray_real_T *gpu,
                                        const emxArray_real_T *cpu)
{
  int32_T actualSize;
  actualSize = 1;
  for (int32_T i{0}; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }
  checkCudaError(cudaMemcpy(gpu->data, cpu->data,
                            static_cast<uint32_T>(actualSize) * sizeof(real_T),
                            cudaMemcpyHostToDevice),
                 __FILE__, __LINE__);
}

static void gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T *cpu,
                                        emxArray_real_T *gpu)
{
  int32_T actualSize;
  actualSize = 1;
  for (int32_T i{0}; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }
  checkCudaError(cudaMemcpy(cpu->data, gpu->data,
                            static_cast<uint32_T>(actualSize) * sizeof(real_T),
                            cudaMemcpyDeviceToHost),
                 __FILE__, __LINE__);
}

static void gpuEmxReset_real_T(emxArray_real_T *gpu)
{
  std::memset(gpu, 0, sizeof(emxArray_real_T));
}

static __global__
    __launch_bounds__(1024, 1) void h_parrot_optimizer_animated_ker(
        const emxArray_real_T v, const int32_T b, emxArray_real_T y)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    y.data[k] = fabs(v.data[k]);
  }
}

static __global__
    __launch_bounds__(1024, 1) void i_parrot_optimizer_animated_ker(
        const emxArray_real_T y, const int32_T b, emxArray_real_T b_y)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    b_y.data[k] = pow(y.data[k], 0.66666666666666663);
  }
}

static __global__
    __launch_bounds__(1024, 1) void j_parrot_optimizer_animated_ker(
        const emxArray_real_T X_mean, const real_T t2, const emxArray_real_T y,
        const emxArray_real_T r, const emxArray_real_T X_best,
        const emxArray_real_T X, const int32_T i, const int32_T b_X,
        emxArray_real_T X_new, int32_T X_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_X);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    X_new.data[xpageoffset] =
        (X.data[i + X_dim0 * xpageoffset] - X_best.data[xpageoffset]) *
            (r.data[xpageoffset] * 0.69657450255769682 / y.data[xpageoffset]) +
        t2 * X_mean.data[xpageoffset];
  }
}

static __global__ __launch_bounds__(
    1024, 1) void k_parrot_optimizer_animated_ker(const real_T lb,
                                                  const emxArray_real_T X_new,
                                                  const int32_T b,
                                                  emxArray_real_T maxval)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    maxval.data[k] = fmax(X_new.data[k], lb);
  }
}

static __global__ __launch_bounds__(
    1024, 1) void l_parrot_optimizer_animated_ker(const real_T ub,
                                                  const emxArray_real_T maxval,
                                                  const int32_T b,
                                                  emxArray_real_T X_new)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    X_new.data[k] = fmin(maxval.data[k], ub);
  }
}

static __global__
    __launch_bounds__(1024, 1) void m_parrot_optimizer_animated_ker(
        const emxArray_real_T X_new, const int32_T i, const int32_T b,
        emxArray_real_T X, int32_T X_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    X.data[i + X_dim0 * xpageoffset] = X_new.data[xpageoffset];
  }
}

static __global__
    __launch_bounds__(1024, 1) void n_parrot_optimizer_animated_ker(
        const emxArray_real_T v, const int32_T b, emxArray_real_T y)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    y.data[k] = fabs(v.data[k]);
  }
}

static __global__
    __launch_bounds__(1024, 1) void o_parrot_optimizer_animated_ker(
        const emxArray_real_T y, const int32_T b, emxArray_real_T b_y)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    b_y.data[k] = pow(y.data[k], 0.66666666666666663);
  }
}

static __global__
    __launch_bounds__(1024, 1) void p_parrot_optimizer_animated_ker(
        const emxArray_real_T dv5, const emxArray_real_T y,
        const emxArray_real_T r, const emxArray_real_T X_best,
        const emxArray_real_T X, const int32_T i, const int32_T b_X,
        emxArray_real_T X_new, int32_T X_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_X);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    X_new.data[xpageoffset] =
        (X.data[i + X_dim0 * xpageoffset] +
         X_best.data[xpageoffset] * (r.data[xpageoffset] * 0.69657450255769682 /
                                     y.data[xpageoffset])) +
        dv5.data[xpageoffset];
  }
}

static __global__
    __launch_bounds__(1024, 1) void q_parrot_optimizer_animated_ker(
        const emxArray_real_T X_mean, const emxArray_real_T X, const int32_T i,
        const real_T t2, const int32_T b_X, emxArray_real_T X_new,
        int32_T X_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_X);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    X_new.data[xpageoffset] =
        t2 * (X.data[i + X_dim0 * xpageoffset] - X_mean.data[xpageoffset]);
  }
}

static __global__
    __launch_bounds__(1024, 1) void r_parrot_optimizer_animated_ker(
        const real_T Max_iter, const emxArray_real_T r, const int32_T npages,
        const int32_T b_r, emxArray_real_T dv4)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_r);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    dv4.data[xpageoffset] =
        static_cast<real_T>(npages) / (r.data[xpageoffset] * Max_iter);
  }
}

static void raiseCudaError(int32_T errCode, const char_T *file, uint32_T b_line,
                           const char_T *errorName, const char_T *errorString)
{
  emlrtRTEInfo rtInfo;
  uint64_T len;
  char_T *brk;
  char_T *fn;
  char_T *pn;
  len = strlen(file);
  pn = static_cast<char_T *>(calloc(len + 1ULL, 1ULL));
  fn = static_cast<char_T *>(calloc(len + 1ULL, 1ULL));
  memcpy(pn, file, len);
  memcpy(fn, file, len);
  brk = strrchr(fn, '.');
  *brk = '\x00';
  brk = strrchr(fn, '/');
  if (brk == nullptr) {
    brk = strrchr(fn, '\\');
  }
  if (brk == nullptr) {
    brk = fn;
  } else {
    brk++;
  }
  rtInfo.lineNo = static_cast<int32_T>(b_line);
  rtInfo.colNo = 0;
  rtInfo.fName = brk;
  rtInfo.pName = pn;
  emlrtCUDAError(static_cast<uint32_T>(errCode), (char_T *)errorName,
                 (char_T *)errorString, &rtInfo, emlrtRootTLSGlobal);
}

static real_T rt_powd_snf(real_T u0, real_T u1)
{
  real_T y;
  if (std::isnan(u0) || std::isnan(u1)) {
    y = rtNaN;
  } else {
    real_T b;
    real_T c;
    b = std::abs(u0);
    c = std::abs(u1);
    if (std::isinf(u1)) {
      if (b == 1.0) {
        y = 1.0;
      } else if (b > 1.0) {
        if (u1 > 0.0) {
          y = rtInf;
        } else {
          y = 0.0;
        }
      } else if (u1 > 0.0) {
        y = 0.0;
      } else {
        y = rtInf;
      }
    } else if (c == 0.0) {
      y = 1.0;
    } else if (c == 1.0) {
      if (u1 > 0.0) {
        y = u0;
      } else {
        y = 1.0 / u0;
      }
    } else if (u1 == 2.0) {
      y = u0 * u0;
    } else if ((u1 == 0.5) && (u0 >= 0.0)) {
      y = std::sqrt(u0);
    } else if ((u0 < 0.0) && (u1 > std::floor(u1))) {
      y = rtNaN;
    } else {
      y = std::pow(u0, u1);
    }
  }
  return y;
}

static __global__ __launch_bounds__(
    1024, 1) void s_parrot_optimizer_animated_ker(const int32_T b,
                                                  emxArray_real_T dv4)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    dv4.data[k] = exp(dv4.data[k]);
  }
}

static __global__
    __launch_bounds__(1024, 1) void t_parrot_optimizer_animated_ker(
        const emxArray_real_T dv4, const emxArray_real_T r,
        const emxArray_real_T X, const int32_T i, const int32_T b_X,
        emxArray_real_T X_new, int32_T X_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_X);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    X_new.data[xpageoffset] = X.data[i + X_dim0 * xpageoffset] +
                              0.2 * r.data[xpageoffset] * dv4.data[xpageoffset];
  }
}

static __global__
    __launch_bounds__(1024, 1) void u_parrot_optimizer_animated_ker(
        const real_T St, const real_T t2, const emxArray_real_T X,
        const int32_T i, const emxArray_real_T X_best, const int32_T b_X,
        emxArray_real_T X_new, int32_T X_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_X);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    real_T d;
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    d = X_best.data[xpageoffset];
    X_new.data[xpageoffset] = (X.data[i + X_dim0 * xpageoffset] +
                               t2 * (d - X.data[i + X_dim0 * xpageoffset])) -
                              St * (X.data[i + X_dim0 * xpageoffset] - d);
  }
}

static __global__
    __launch_bounds__(1024, 1) void v_parrot_optimizer_animated_ker(
        const emxArray_real_T X, const int32_T npages, const int32_T b_X,
        emxArray_real_T X_best, int32_T X_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_X);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    X_best.data[xpageoffset] = X.data[npages + X_dim0 * xpageoffset];
  }
}

static __global__
    __launch_bounds__(1024, 1) void w_parrot_optimizer_animated_ker(
        const int32_T vlen, const emxArray_real_T X, const int32_T b,
        emxArray_real_T y, int32_T X_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    int32_T xpageoffset;
    i = static_cast<int32_T>(idx);
    xpageoffset = i * X_dim0;
    y.data[i] = X.data[xpageoffset];
    for (int32_T k{0}; k <= vlen - 2; k++) {
      y.data[i] += X.data[(xpageoffset + k) + 1];
    }
  }
}

void parrot_optimizer_animated(real_T N, real_T Max_iter, real_T lb, real_T ub,
                               real_T dim, emxArray_real_T *cpu_X_best,
                               real_T *f_best,
                               emxArray_real_T *Convergence_curve,
                               emxArray_cell_wrap_0 *all_positions)
{
  dim3 block;
  dim3 grid;
  emxArray_real_T b_gpu_r;
  emxArray_real_T b_gpu_y;
  emxArray_real_T c_gpu_r;
  emxArray_real_T c_gpu_y;
  emxArray_real_T d_gpu_r;
  emxArray_real_T d_gpu_y;
  emxArray_real_T e_gpu_r;
  emxArray_real_T e_gpu_y;
  emxArray_real_T gpu_X;
  emxArray_real_T gpu_X_best;
  emxArray_real_T gpu_X_mean;
  emxArray_real_T gpu_X_new;
  emxArray_real_T gpu_dv4;
  emxArray_real_T gpu_dv5;
  emxArray_real_T gpu_fitness;
  emxArray_real_T gpu_maxval;
  emxArray_real_T gpu_r;
  emxArray_real_T gpu_v;
  emxArray_real_T gpu_y;
  emxArray_real_T *b_cpu_r;
  emxArray_real_T *b_cpu_y;
  emxArray_real_T *c_cpu_r;
  emxArray_real_T *c_cpu_y;
  emxArray_real_T *cpu_X;
  emxArray_real_T *cpu_X_mean;
  emxArray_real_T *cpu_X_new;
  emxArray_real_T *cpu_dv4;
  emxArray_real_T *cpu_dv5;
  emxArray_real_T *cpu_fitness;
  emxArray_real_T *cpu_maxval;
  emxArray_real_T *cpu_r;
  emxArray_real_T *cpu_v;
  emxArray_real_T *cpu_y;
  emxArray_real_T *d_cpu_r;
  emxArray_real_T *d_cpu_y;
  emxArray_real_T *e_cpu_r;
  emxArray_real_T *e_cpu_y;
  real_T St;
  real_T ex;
  int32_T b_i;
  int32_T i;
  int32_T i2;
  int32_T i3;
  int32_T npages;
  int32_T vlen;
  boolean_T X_best_needsGpuEnsureCapacity;
  boolean_T X_best_outdatedOnCpu;
  boolean_T X_needsGpuEnsureCapacity;
  boolean_T X_outdatedOnCpu;
  boolean_T b_r_outdatedOnGpu;
  boolean_T c_r_outdatedOnGpu;
  boolean_T dv5_outdatedOnGpu;
  boolean_T p;
  boolean_T r_outdatedOnGpu;
  boolean_T v_outdatedOnGpu;
  boolean_T validLaunchParams;
  gpuEmxReset_real_T(&gpu_dv5);
  gpuEmxReset_real_T(&c_gpu_y);
  gpuEmxReset_real_T(&e_gpu_y);
  gpuEmxReset_real_T(&gpu_maxval);
  gpuEmxReset_real_T(&gpu_dv4);
  gpuEmxReset_real_T(&b_gpu_y);
  gpuEmxReset_real_T(&d_gpu_y);
  gpuEmxReset_real_T(&d_gpu_r);
  gpuEmxReset_real_T(&gpu_X_new);
  gpuEmxReset_real_T(&gpu_v);
  gpuEmxReset_real_T(&e_gpu_r);
  gpuEmxReset_real_T(&b_gpu_r);
  gpuEmxReset_real_T(&c_gpu_r);
  gpuEmxReset_real_T(&gpu_X_mean);
  gpuEmxReset_real_T(&gpu_y);
  gpuEmxReset_real_T(&gpu_fitness);
  gpuEmxReset_real_T(&gpu_X);
  gpuEmxReset_real_T(&gpu_r);
  gpuEmxReset_real_T(&gpu_X_best);
  dv5_outdatedOnGpu = false;
  v_outdatedOnGpu = false;
  c_r_outdatedOnGpu = false;
  b_r_outdatedOnGpu = false;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  //  初始化
  //  生成均匀分布的初始种群
  emxInit_real_T(&cpu_r, 2, &u_emlrtRTEI, true);
  r_outdatedOnGpu = false;
  i = cpu_r->size[0] * cpu_r->size[1];
  cpu_r->size[0] = static_cast<int32_T>(N);
  cpu_r->size[1] = static_cast<int32_T>(dim);
  emxEnsureCapacity_real_T(cpu_r, i, &emlrtRTEI);
  if ((static_cast<int32_T>(N) != 0) && (static_cast<int32_T>(dim) != 0)) {
    emlrtRandu(&cpu_r->data[0],
               static_cast<int32_T>(N) * static_cast<int32_T>(dim));
    r_outdatedOnGpu = true;
  }
  emxInit_real_T(&cpu_X, 2, &b_emlrtRTEI, true);
  i = cpu_X->size[0] * cpu_X->size[1];
  cpu_X->size[0] = cpu_r->size[0];
  cpu_X->size[1] = cpu_r->size[1];
  emxEnsureCapacity_real_T(cpu_X, i, &b_emlrtRTEI);
  vlen = cpu_r->size[0] * cpu_r->size[1] - 1;
  mwGetLaunchParameters1D(computeNumIters(vlen), &grid, &block, 2147483647U);
  gpuEmxEnsureCapacity_real_T(cpu_r, &gpu_r, !r_outdatedOnGpu);
  gpuEmxEnsureCapacity_real_T(cpu_X, &gpu_X, true);
  if (r_outdatedOnGpu) {
    gpuEmxMemcpyCpuToGpu_real_T(&gpu_r, cpu_r);
  }
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    c_parrot_optimizer_animated_ker<<<grid, block>>>(lb, ub - lb, gpu_r, vlen,
                                                     gpu_X);
  }
  cudaDeviceSynchronize();
  checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
  X_outdatedOnCpu = true;
  emxFree_real_T(&cpu_r);
  //  输入：x为N×2矩阵，每行代表一个个体（二维）
  //  输出：N×1向量，每个个体的适应度值
  emxInit_real_T(&cpu_fitness, 1, &v_emlrtRTEI, true);
  i = cpu_fitness->size[0];
  cpu_fitness->size[0] = cpu_X->size[0];
  emxEnsureCapacity_real_T(cpu_fitness, i, &c_emlrtRTEI);
  b_i = cpu_X->size[0];
  mwGetLaunchParameters1D(computeNumIters(b_i - 1), &grid, &block, 2147483647U);
  gpuEmxEnsureCapacity_real_T(cpu_fitness, &gpu_fitness, true);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    d_parrot_optimizer_animated_ker<<<grid, block>>>(
        gpu_X, b_i - 1, gpu_fitness, cpu_X->size[0U]);
  }
  cudaDeviceSynchronize();
  checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
  npages = 0;
  vlen = cpu_fitness->size[0];
  gpuEmxMemcpyGpuToCpu_real_T(cpu_fitness, &gpu_fitness);
  ex = cpu_fitness->data[0];
  for (b_i = 0; b_i <= vlen - 2; b_i++) {
    if (std::isnan(cpu_fitness->data[b_i + 1])) {
      p = false;
    } else if (std::isnan(ex)) {
      p = true;
    } else {
      p = (ex > cpu_fitness->data[b_i + 1]);
    }
    if (p) {
      ex = cpu_fitness->data[b_i + 1];
      npages = b_i + 1;
    }
  }
  i = cpu_X_best->size[0] * cpu_X_best->size[1];
  cpu_X_best->size[0] = 1;
  cpu_X_best->size[1] = cpu_X->size[1];
  emxEnsureCapacity_real_T(cpu_X_best, i, &d_emlrtRTEI);
  vlen = cpu_X->size[1] - 1;
  mwGetLaunchParameters1D(computeNumIters(vlen), &grid, &block, 2147483647U);
  X_needsGpuEnsureCapacity = false;
  gpuEmxEnsureCapacity_real_T(cpu_X_best, &gpu_X_best, true);
  X_best_needsGpuEnsureCapacity = false;
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    e_parrot_optimizer_animated_ker<<<grid, block>>>(
        gpu_X, npages, vlen, gpu_X_best, cpu_X->size[0U]);
  }
  cudaDeviceSynchronize();
  checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
  X_best_outdatedOnCpu = true;
  //  新增轨迹存储
  //  初始化 Convergence_curve 数组
  i = Convergence_curve->size[0];
  Convergence_curve->size[0] = static_cast<int32_T>(Max_iter);
  emxEnsureCapacity_real_T(Convergence_curve, i, &e_emlrtRTEI);
  //  预先分配足够内存
  //  迭代优化
  i2 = static_cast<int32_T>(Max_iter);
  i = all_positions->size[0];
  all_positions->size[0] = static_cast<int32_T>(Max_iter);
  emxEnsureCapacity_cell_wrap_0(all_positions, i, &f_emlrtRTEI);
  emxInit_real_T(&cpu_y, 2, &w_emlrtRTEI, true);
  if (static_cast<int32_T>(Max_iter) - 1 >= 0) {
    i3 = static_cast<int32_T>(N);
  }
  emxInit_real_T(&cpu_X_mean, 2, &i_emlrtRTEI, true);
  emxInit_real_T(&b_cpu_r, 2, &x_emlrtRTEI, true);
  emxInit_real_T(&c_cpu_r, 2, &x_emlrtRTEI, true);
  emxInit_real_T(&d_cpu_r, 2, &y_emlrtRTEI, true);
  emxInit_real_T(&cpu_v, 2, &ab_emlrtRTEI, true);
  emxInit_real_T(&cpu_X_new, 2, &s_emlrtRTEI, true);
  emxInit_real_T(&e_cpu_r, 2, &bb_emlrtRTEI, true);
  emxInit_real_T(&b_cpu_y, 2, &cb_emlrtRTEI, true);
  emxInit_real_T(&c_cpu_y, 2, &db_emlrtRTEI, true);
  emxInit_real_T(&cpu_dv4, 2, &eb_emlrtRTEI, true);
  emxInit_real_T(&cpu_maxval, 2, &fb_emlrtRTEI, true);
  emxInit_real_T(&d_cpu_y, 2, &cb_emlrtRTEI, true);
  emxInit_real_T(&e_cpu_y, 2, &db_emlrtRTEI, true);
  emxInit_real_T(&cpu_dv5, 2, &gb_emlrtRTEI, true);
  for (int32_T t{0}; t < i2; t++) {
    boolean_T X_mean_needsGpuEnsureCapacity;
    boolean_T X_mean_outdatedOnCpu;
    vlen = cpu_X->size[0];
    if ((cpu_X->size[0] == 0) || (cpu_X->size[1] == 0)) {
      uint32_T sz[2];
      for (vlen = 0; vlen < 2; vlen++) {
        sz[vlen] = static_cast<uint32_T>(cpu_X->size[vlen]);
      }
      i = cpu_y->size[0] * cpu_y->size[1];
      cpu_y->size[0] = 1;
      cpu_y->size[1] = static_cast<int32_T>(sz[1]);
      emxEnsureCapacity_real_T(cpu_y, i, &h_emlrtRTEI);
      mwGetLaunchParameters1D(computeNumIters(static_cast<int32_T>(sz[1]) - 1),
                              &grid, &block, 2147483647U);
      gpuEmxEnsureCapacity_real_T(cpu_y, &gpu_y, true);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        f_parrot_optimizer_animated_ker<<<grid, block>>>(
            static_cast<int32_T>(sz[1]) - 1, gpu_y);
      }
      cudaDeviceSynchronize();
      checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
    } else {
      npages = cpu_X->size[1];
      i = cpu_y->size[0] * cpu_y->size[1];
      cpu_y->size[0] = 1;
      cpu_y->size[1] = cpu_X->size[1];
      emxEnsureCapacity_real_T(cpu_y, i, &g_emlrtRTEI);
      mwGetLaunchParameters1D(computeNumIters(npages - 1), &grid, &block,
                              2147483647U);
      if (X_needsGpuEnsureCapacity) {
        gpuEmxEnsureCapacity_real_T(cpu_X, &gpu_X, true);
      }
      X_needsGpuEnsureCapacity = false;
      gpuEmxEnsureCapacity_real_T(cpu_y, &gpu_y, true);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        w_parrot_optimizer_animated_ker<<<grid, block>>>(
            vlen, gpu_X, npages - 1, gpu_y, cpu_X->size[0U]);
      }
      cudaDeviceSynchronize();
      checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
    }
    i = cpu_X_mean->size[0] * cpu_X_mean->size[1];
    cpu_X_mean->size[0] = 1;
    cpu_X_mean->size[1] = cpu_y->size[1];
    emxEnsureCapacity_real_T(cpu_X_mean, i, &i_emlrtRTEI);
    npages = cpu_X->size[0];
    vlen = cpu_y->size[1] - 1;
    mwGetLaunchParameters1D(computeNumIters(vlen), &grid, &block, 2147483647U);
    gpuEmxEnsureCapacity_real_T(cpu_X_mean, &gpu_X_mean, true);
    X_mean_needsGpuEnsureCapacity = false;
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      g_parrot_optimizer_animated_ker<<<grid, block>>>(npages, gpu_y, vlen,
                                                       gpu_X_mean);
    }
    cudaDeviceSynchronize();
    checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
    X_mean_outdatedOnCpu = true;
    i = all_positions->data[t].f1->size[0] * all_positions->data[t].f1->size[1];
    all_positions->data[t].f1->size[0] = cpu_X->size[0];
    all_positions->data[t].f1->size[1] = cpu_X->size[1];
    emxEnsureCapacity_real_T(all_positions->data[t].f1, i, &j_emlrtRTEI);
    for (i = 0; i < cpu_X->size[0] * cpu_X->size[1]; i++) {
      if (X_outdatedOnCpu) {
        gpuEmxMemcpyGpuToCpu_real_T(cpu_X, &gpu_X);
      }
      X_outdatedOnCpu = false;
      all_positions->data[t].f1->data[i] = cpu_X->data[i];
      X_needsGpuEnsureCapacity = true;
    }
    //  记录当前代粒子位置
    for (b_i = 0; b_i < i3; b_i++) {
      real_T d2;
      real_T d3;
      real_T t2;
      boolean_T X_new_needsGpuEnsureCapacity;
      //  随机行为选择（同原算法）
      emlrtRandu(&St, 1);
      St = std::floor(St * 4.0);
      //  行为1：觅食行为
      if (St + 1.0 == 1.0) {
        //  Levy指数
        i = c_cpu_r->size[0] * c_cpu_r->size[1];
        c_cpu_r->size[0] = 1;
        c_cpu_r->size[1] = static_cast<int32_T>(dim);
        emxEnsureCapacity_real_T(c_cpu_r, i, &k_emlrtRTEI);
        if (static_cast<int32_T>(dim) != 0) {
          emlrtRandn(&c_cpu_r->data[0], static_cast<int32_T>(dim));
          c_r_outdatedOnGpu = true;
        }
        i = cpu_v->size[0] * cpu_v->size[1];
        cpu_v->size[0] = 1;
        cpu_v->size[1] = static_cast<int32_T>(dim);
        emxEnsureCapacity_real_T(cpu_v, i, &k_emlrtRTEI);
        if (static_cast<int32_T>(dim) != 0) {
          emlrtRandn(&cpu_v->data[0], static_cast<int32_T>(dim));
          v_outdatedOnGpu = true;
        }
        npages = cpu_v->size[1];
        i = c_cpu_y->size[0] * c_cpu_y->size[1];
        c_cpu_y->size[0] = 1;
        c_cpu_y->size[1] = cpu_v->size[1];
        emxEnsureCapacity_real_T(c_cpu_y, i, &o_emlrtRTEI);
        mwGetLaunchParameters1D(computeNumIters(npages - 1), &grid, &block,
                                2147483647U);
        gpuEmxEnsureCapacity_real_T(cpu_v, &gpu_v, !v_outdatedOnGpu);
        gpuEmxEnsureCapacity_real_T(c_cpu_y, &b_gpu_y, true);
        if (v_outdatedOnGpu) {
          gpuEmxMemcpyCpuToGpu_real_T(&gpu_v, cpu_v);
        }
        v_outdatedOnGpu = false;
        validLaunchParams = mwValidateLaunchParameters(grid, block);
        if (validLaunchParams) {
          h_parrot_optimizer_animated_ker<<<grid, block>>>(gpu_v, npages - 1,
                                                           b_gpu_y);
        }
        cudaDeviceSynchronize();
        checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
        i = e_cpu_y->size[0] * e_cpu_y->size[1];
        e_cpu_y->size[0] = 1;
        e_cpu_y->size[1] = c_cpu_y->size[1];
        emxEnsureCapacity_real_T(e_cpu_y, i, &p_emlrtRTEI);
        npages = c_cpu_y->size[1];
        mwGetLaunchParameters1D(computeNumIters(npages - 1), &grid, &block,
                                2147483647U);
        gpuEmxEnsureCapacity_real_T(e_cpu_y, &c_gpu_y, true);
        validLaunchParams = mwValidateLaunchParameters(grid, block);
        if (validLaunchParams) {
          i_parrot_optimizer_animated_ker<<<grid, block>>>(b_gpu_y, npages - 1,
                                                           c_gpu_y);
        }
        cudaDeviceSynchronize();
        checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
        //  Levy飞行向量
        emlrtRandu(&St, 1);
        t2 = St * rt_powd_snf(1.0 - (static_cast<real_T>(t) + 1.0) / Max_iter,
                              2.0 * (static_cast<real_T>(t) + 1.0) / Max_iter);
        if (cpu_X->size[1] == 1) {
          vlen = cpu_X_best->size[1];
        } else {
          vlen = cpu_X->size[1];
        }
        if (c_cpu_r->size[1] == 1) {
          i = e_cpu_y->size[1];
        } else {
          i = c_cpu_r->size[1];
        }
        if (cpu_X->size[1] == 1) {
          npages = cpu_X_best->size[1];
        } else {
          npages = cpu_X->size[1];
        }
        if (npages == 1) {
          if (c_cpu_r->size[1] == 1) {
            npages = e_cpu_y->size[1];
          } else {
            npages = c_cpu_r->size[1];
          }
        } else if (cpu_X->size[1] == 1) {
          npages = cpu_X_best->size[1];
        } else {
          npages = cpu_X->size[1];
        }
        if ((cpu_X->size[1] == cpu_X_best->size[1]) &&
            (c_cpu_r->size[1] == e_cpu_y->size[1]) && (vlen == i) &&
            (npages == cpu_X_mean->size[1])) {
          i = cpu_X_new->size[0] * cpu_X_new->size[1];
          cpu_X_new->size[0] = 1;
          cpu_X_new->size[1] = cpu_X->size[1];
          emxEnsureCapacity_real_T(cpu_X_new, i, &s_emlrtRTEI);
          vlen = cpu_X->size[1] - 1;
          mwGetLaunchParameters1D(computeNumIters(vlen), &grid, &block,
                                  2147483647U);
          if (X_mean_needsGpuEnsureCapacity) {
            gpuEmxEnsureCapacity_real_T(cpu_X_mean, &gpu_X_mean, true);
          }
          X_mean_needsGpuEnsureCapacity = false;
          gpuEmxEnsureCapacity_real_T(c_cpu_r, &b_gpu_r, !c_r_outdatedOnGpu);
          if (X_best_needsGpuEnsureCapacity) {
            gpuEmxEnsureCapacity_real_T(cpu_X_best, &gpu_X_best, true);
          }
          X_best_needsGpuEnsureCapacity = false;
          if (X_needsGpuEnsureCapacity) {
            gpuEmxEnsureCapacity_real_T(cpu_X, &gpu_X, true);
          }
          X_needsGpuEnsureCapacity = false;
          gpuEmxEnsureCapacity_real_T(cpu_X_new, &gpu_X_new, true);
          X_new_needsGpuEnsureCapacity = false;
          if (c_r_outdatedOnGpu) {
            gpuEmxMemcpyCpuToGpu_real_T(&b_gpu_r, c_cpu_r);
          }
          c_r_outdatedOnGpu = false;
          validLaunchParams = mwValidateLaunchParameters(grid, block);
          if (validLaunchParams) {
            j_parrot_optimizer_animated_ker<<<grid, block>>>(
                gpu_X_mean, t2, c_gpu_y, b_gpu_r, gpu_X_best, gpu_X, b_i, vlen,
                gpu_X_new, cpu_X->size[0U]);
          }
          cudaDeviceSynchronize();
          checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
          p = false;
        } else {
          if (X_outdatedOnCpu) {
            gpuEmxMemcpyGpuToCpu_real_T(cpu_X, &gpu_X);
          }
          X_outdatedOnCpu = false;
          if (X_best_outdatedOnCpu) {
            gpuEmxMemcpyGpuToCpu_real_T(cpu_X_best, &gpu_X_best);
          }
          X_best_outdatedOnCpu = false;
          gpuEmxMemcpyGpuToCpu_real_T(e_cpu_y, &c_gpu_y);
          if (X_mean_outdatedOnCpu) {
            gpuEmxMemcpyGpuToCpu_real_T(cpu_X_mean, &gpu_X_mean);
          }
          X_mean_outdatedOnCpu = false;
          binary_expand_op(cpu_X_new, cpu_X, b_i, cpu_X_best, c_cpu_r, e_cpu_y,
                           t2, cpu_X_mean);
          p = true;
          X_mean_needsGpuEnsureCapacity = true;
          X_best_needsGpuEnsureCapacity = true;
          X_needsGpuEnsureCapacity = true;
          X_new_needsGpuEnsureCapacity = true;
        }
        //  行为2：停留行为
      } else if (St + 1.0 == 2.0) {
        i = b_cpu_r->size[0] * b_cpu_r->size[1];
        b_cpu_r->size[0] = 1;
        b_cpu_r->size[1] = static_cast<int32_T>(dim);
        emxEnsureCapacity_real_T(b_cpu_r, i, &k_emlrtRTEI);
        if (static_cast<int32_T>(dim) != 0) {
          emlrtRandn(&b_cpu_r->data[0], static_cast<int32_T>(dim));
          b_r_outdatedOnGpu = true;
        }
        i = cpu_v->size[0] * cpu_v->size[1];
        cpu_v->size[0] = 1;
        cpu_v->size[1] = static_cast<int32_T>(dim);
        emxEnsureCapacity_real_T(cpu_v, i, &k_emlrtRTEI);
        if (static_cast<int32_T>(dim) != 0) {
          emlrtRandn(&cpu_v->data[0], static_cast<int32_T>(dim));
          v_outdatedOnGpu = true;
        }
        npages = cpu_v->size[1];
        i = b_cpu_y->size[0] * b_cpu_y->size[1];
        b_cpu_y->size[0] = 1;
        b_cpu_y->size[1] = cpu_v->size[1];
        emxEnsureCapacity_real_T(b_cpu_y, i, &o_emlrtRTEI);
        mwGetLaunchParameters1D(computeNumIters(npages - 1), &grid, &block,
                                2147483647U);
        gpuEmxEnsureCapacity_real_T(cpu_v, &gpu_v, !v_outdatedOnGpu);
        gpuEmxEnsureCapacity_real_T(b_cpu_y, &d_gpu_y, true);
        if (v_outdatedOnGpu) {
          gpuEmxMemcpyCpuToGpu_real_T(&gpu_v, cpu_v);
        }
        v_outdatedOnGpu = false;
        validLaunchParams = mwValidateLaunchParameters(grid, block);
        if (validLaunchParams) {
          n_parrot_optimizer_animated_ker<<<grid, block>>>(gpu_v, npages - 1,
                                                           d_gpu_y);
        }
        cudaDeviceSynchronize();
        checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
        i = d_cpu_y->size[0] * d_cpu_y->size[1];
        d_cpu_y->size[0] = 1;
        d_cpu_y->size[1] = b_cpu_y->size[1];
        emxEnsureCapacity_real_T(d_cpu_y, i, &p_emlrtRTEI);
        npages = b_cpu_y->size[1];
        mwGetLaunchParameters1D(computeNumIters(npages - 1), &grid, &block,
                                2147483647U);
        gpuEmxEnsureCapacity_real_T(d_cpu_y, &e_gpu_y, true);
        validLaunchParams = mwValidateLaunchParameters(grid, block);
        if (validLaunchParams) {
          o_parrot_optimizer_animated_ker<<<grid, block>>>(d_gpu_y, npages - 1,
                                                           e_gpu_y);
        }
        cudaDeviceSynchronize();
        checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
        i = cpu_dv5->size[0] * cpu_dv5->size[1];
        cpu_dv5->size[0] = 1;
        cpu_dv5->size[1] = static_cast<int32_T>(dim);
        emxEnsureCapacity_real_T(cpu_dv5, i, &emlrtRTEI);
        if (static_cast<int32_T>(dim) != 0) {
          emlrtRandu(&cpu_dv5->data[0], static_cast<int32_T>(dim));
          dv5_outdatedOnGpu = true;
        }
        if (b_cpu_r->size[1] == 1) {
          vlen = d_cpu_y->size[1];
        } else {
          vlen = b_cpu_r->size[1];
        }
        if (cpu_X_best->size[1] == 1) {
          if (b_cpu_r->size[1] == 1) {
            i = d_cpu_y->size[1];
          } else {
            i = b_cpu_r->size[1];
          }
        } else {
          i = cpu_X_best->size[1];
        }
        if (cpu_X->size[1] == 1) {
          if (cpu_X_best->size[1] == 1) {
            if (b_cpu_r->size[1] == 1) {
              npages = d_cpu_y->size[1];
            } else {
              npages = b_cpu_r->size[1];
            }
          } else {
            npages = cpu_X_best->size[1];
          }
        } else {
          npages = cpu_X->size[1];
        }
        if ((b_cpu_r->size[1] == d_cpu_y->size[1]) &&
            (cpu_X_best->size[1] == vlen) && (cpu_X->size[1] == i) &&
            (npages == cpu_dv5->size[1])) {
          i = cpu_X_new->size[0] * cpu_X_new->size[1];
          cpu_X_new->size[0] = 1;
          cpu_X_new->size[1] = cpu_X->size[1];
          emxEnsureCapacity_real_T(cpu_X_new, i, &r_emlrtRTEI);
          vlen = cpu_X->size[1] - 1;
          mwGetLaunchParameters1D(computeNumIters(vlen), &grid, &block,
                                  2147483647U);
          gpuEmxEnsureCapacity_real_T(cpu_dv5, &gpu_dv5, !dv5_outdatedOnGpu);
          gpuEmxEnsureCapacity_real_T(b_cpu_r, &c_gpu_r, !b_r_outdatedOnGpu);
          if (X_best_needsGpuEnsureCapacity) {
            gpuEmxEnsureCapacity_real_T(cpu_X_best, &gpu_X_best, true);
          }
          X_best_needsGpuEnsureCapacity = false;
          if (X_needsGpuEnsureCapacity) {
            gpuEmxEnsureCapacity_real_T(cpu_X, &gpu_X, true);
          }
          X_needsGpuEnsureCapacity = false;
          gpuEmxEnsureCapacity_real_T(cpu_X_new, &gpu_X_new, true);
          X_new_needsGpuEnsureCapacity = false;
          if (dv5_outdatedOnGpu) {
            gpuEmxMemcpyCpuToGpu_real_T(&gpu_dv5, cpu_dv5);
          }
          dv5_outdatedOnGpu = false;
          if (b_r_outdatedOnGpu) {
            gpuEmxMemcpyCpuToGpu_real_T(&c_gpu_r, b_cpu_r);
          }
          b_r_outdatedOnGpu = false;
          validLaunchParams = mwValidateLaunchParameters(grid, block);
          if (validLaunchParams) {
            p_parrot_optimizer_animated_ker<<<grid, block>>>(
                gpu_dv5, e_gpu_y, c_gpu_r, gpu_X_best, gpu_X, b_i, vlen,
                gpu_X_new, cpu_X->size[0U]);
          }
          cudaDeviceSynchronize();
          checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
          p = false;
        } else {
          if (X_outdatedOnCpu) {
            gpuEmxMemcpyGpuToCpu_real_T(cpu_X, &gpu_X);
          }
          X_outdatedOnCpu = false;
          if (X_best_outdatedOnCpu) {
            gpuEmxMemcpyGpuToCpu_real_T(cpu_X_best, &gpu_X_best);
          }
          X_best_outdatedOnCpu = false;
          gpuEmxMemcpyGpuToCpu_real_T(d_cpu_y, &e_gpu_y);
          binary_expand_op_1(cpu_X_new, cpu_X, b_i, cpu_X_best, b_cpu_r,
                             d_cpu_y, cpu_dv5);
          p = true;
          X_best_needsGpuEnsureCapacity = true;
          X_needsGpuEnsureCapacity = true;
          X_new_needsGpuEnsureCapacity = true;
        }
        //  行为3：交流行为
      } else if (St + 1.0 == 3.0) {
        emlrtRandu(&St, 1);
        if (St <= 0.5) {
          emlrtRandu(&St, 1);
          t2 = 0.2 * St * (1.0 - (static_cast<real_T>(t) + 1.0) / Max_iter);
          if (cpu_X->size[1] == cpu_X_mean->size[1]) {
            i = cpu_X_new->size[0] * cpu_X_new->size[1];
            cpu_X_new->size[0] = 1;
            cpu_X_new->size[1] = cpu_X->size[1];
            emxEnsureCapacity_real_T(cpu_X_new, i, &n_emlrtRTEI);
            vlen = cpu_X->size[1] - 1;
            mwGetLaunchParameters1D(computeNumIters(vlen), &grid, &block,
                                    2147483647U);
            if (X_mean_needsGpuEnsureCapacity) {
              gpuEmxEnsureCapacity_real_T(cpu_X_mean, &gpu_X_mean, true);
            }
            X_mean_needsGpuEnsureCapacity = false;
            if (X_needsGpuEnsureCapacity) {
              gpuEmxEnsureCapacity_real_T(cpu_X, &gpu_X, true);
            }
            X_needsGpuEnsureCapacity = false;
            gpuEmxEnsureCapacity_real_T(cpu_X_new, &gpu_X_new, true);
            X_new_needsGpuEnsureCapacity = false;
            validLaunchParams = mwValidateLaunchParameters(grid, block);
            if (validLaunchParams) {
              q_parrot_optimizer_animated_ker<<<grid, block>>>(
                  gpu_X_mean, gpu_X, b_i, t2, vlen, gpu_X_new, cpu_X->size[0U]);
            }
            cudaDeviceSynchronize();
            checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
            p = false;
          } else {
            if (X_outdatedOnCpu) {
              gpuEmxMemcpyGpuToCpu_real_T(cpu_X, &gpu_X);
            }
            X_outdatedOnCpu = false;
            if (X_mean_outdatedOnCpu) {
              gpuEmxMemcpyGpuToCpu_real_T(cpu_X_mean, &gpu_X_mean);
            }
            X_mean_outdatedOnCpu = false;
            binary_expand_op_2(cpu_X_new, t2, cpu_X, b_i, cpu_X_mean);
            p = true;
            X_mean_needsGpuEnsureCapacity = true;
            X_needsGpuEnsureCapacity = true;
            X_new_needsGpuEnsureCapacity = true;
          }
        } else {
          r_outdatedOnGpu = false;
          i = d_cpu_r->size[0] * d_cpu_r->size[1];
          d_cpu_r->size[0] = 1;
          d_cpu_r->size[1] = static_cast<int32_T>(dim);
          emxEnsureCapacity_real_T(d_cpu_r, i, &emlrtRTEI);
          if (static_cast<int32_T>(dim) != 0) {
            emlrtRandu(&d_cpu_r->data[0], static_cast<int32_T>(dim));
            r_outdatedOnGpu = true;
          }
          p = false;
          i = e_cpu_r->size[0] * e_cpu_r->size[1];
          e_cpu_r->size[0] = 1;
          e_cpu_r->size[1] = static_cast<int32_T>(dim);
          emxEnsureCapacity_real_T(e_cpu_r, i, &emlrtRTEI);
          if (static_cast<int32_T>(dim) != 0) {
            emlrtRandu(&e_cpu_r->data[0], static_cast<int32_T>(dim));
            p = true;
          }
          i = cpu_dv4->size[0] * cpu_dv4->size[1];
          cpu_dv4->size[0] = 1;
          cpu_dv4->size[1] = e_cpu_r->size[1];
          emxEnsureCapacity_real_T(cpu_dv4, i, &q_emlrtRTEI);
          vlen = e_cpu_r->size[1] - 1;
          mwGetLaunchParameters1D(computeNumIters(vlen), &grid, &block,
                                  2147483647U);
          gpuEmxEnsureCapacity_real_T(e_cpu_r, &d_gpu_r, !p);
          gpuEmxEnsureCapacity_real_T(cpu_dv4, &gpu_dv4, true);
          if (p) {
            gpuEmxMemcpyCpuToGpu_real_T(&d_gpu_r, e_cpu_r);
          }
          validLaunchParams = mwValidateLaunchParameters(grid, block);
          if (validLaunchParams) {
            r_parrot_optimizer_animated_ker<<<grid, block>>>(
                Max_iter, d_gpu_r,
                static_cast<int32_T>(-(static_cast<real_T>(t) + 1.0)), vlen,
                gpu_dv4);
          }
          cudaDeviceSynchronize();
          checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
          npages = cpu_dv4->size[1];
          mwGetLaunchParameters1D(computeNumIters(npages - 1), &grid, &block,
                                  2147483647U);
          validLaunchParams = mwValidateLaunchParameters(grid, block);
          if (validLaunchParams) {
            s_parrot_optimizer_animated_ker<<<grid, block>>>(npages - 1,
                                                             gpu_dv4);
          }
          cudaDeviceSynchronize();
          checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
          if (d_cpu_r->size[1] == 1) {
            vlen = cpu_dv4->size[1];
          } else {
            vlen = d_cpu_r->size[1];
          }
          if ((d_cpu_r->size[1] == cpu_dv4->size[1]) &&
              (cpu_X->size[1] == vlen)) {
            i = cpu_X_new->size[0] * cpu_X_new->size[1];
            cpu_X_new->size[0] = 1;
            cpu_X_new->size[1] = cpu_X->size[1];
            emxEnsureCapacity_real_T(cpu_X_new, i, &t_emlrtRTEI);
            vlen = cpu_X->size[1] - 1;
            mwGetLaunchParameters1D(computeNumIters(vlen), &grid, &block,
                                    2147483647U);
            gpuEmxEnsureCapacity_real_T(d_cpu_r, &e_gpu_r, !r_outdatedOnGpu);
            if (X_needsGpuEnsureCapacity) {
              gpuEmxEnsureCapacity_real_T(cpu_X, &gpu_X, true);
            }
            X_needsGpuEnsureCapacity = false;
            gpuEmxEnsureCapacity_real_T(cpu_X_new, &gpu_X_new, true);
            X_new_needsGpuEnsureCapacity = false;
            if (r_outdatedOnGpu) {
              gpuEmxMemcpyCpuToGpu_real_T(&e_gpu_r, d_cpu_r);
            }
            validLaunchParams = mwValidateLaunchParameters(grid, block);
            if (validLaunchParams) {
              t_parrot_optimizer_animated_ker<<<grid, block>>>(
                  gpu_dv4, e_gpu_r, gpu_X, b_i, vlen, gpu_X_new,
                  cpu_X->size[0U]);
            }
            cudaDeviceSynchronize();
            checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
            p = false;
          } else {
            if (X_outdatedOnCpu) {
              gpuEmxMemcpyGpuToCpu_real_T(cpu_X, &gpu_X);
            }
            X_outdatedOnCpu = false;
            gpuEmxMemcpyGpuToCpu_real_T(cpu_dv4, &gpu_dv4);
            binary_expand_op_3(cpu_X_new, cpu_X, b_i, d_cpu_r, cpu_dv4);
            p = true;
            X_needsGpuEnsureCapacity = true;
            X_new_needsGpuEnsureCapacity = true;
          }
          //  添加随机扰动向量
        }
        //  行为4：恐惧行为
      } else {
        emlrtRandu(&St, 1);
        t2 = St * std::cos(2.5132741228718345 * (static_cast<real_T>(t) + 1.0) /
                           Max_iter);
        emlrtRandu(&St, 1);
        St = std::cos(St * 3.1415926535897931) *
             rt_powd_snf((static_cast<real_T>(t) + 1.0) / Max_iter,
                         2.0 / Max_iter);
        if (cpu_X_best->size[1] == 1) {
          vlen = cpu_X->size[1];
        } else {
          vlen = cpu_X_best->size[1];
        }
        if (cpu_X->size[1] == 1) {
          if (cpu_X_best->size[1] == 1) {
            i = cpu_X->size[1];
          } else {
            i = cpu_X_best->size[1];
          }
        } else {
          i = cpu_X->size[1];
        }
        if (cpu_X->size[1] == 1) {
          npages = cpu_X_best->size[1];
        } else {
          npages = cpu_X->size[1];
        }
        if ((cpu_X_best->size[1] == cpu_X->size[1]) &&
            (cpu_X->size[1] == vlen) &&
            (cpu_X->size[1] == cpu_X_best->size[1]) && (i == npages)) {
          i = cpu_X_new->size[0] * cpu_X_new->size[1];
          cpu_X_new->size[0] = 1;
          cpu_X_new->size[1] = cpu_X->size[1];
          emxEnsureCapacity_real_T(cpu_X_new, i, &m_emlrtRTEI);
          vlen = cpu_X->size[1] - 1;
          mwGetLaunchParameters1D(computeNumIters(vlen), &grid, &block,
                                  2147483647U);
          if (X_needsGpuEnsureCapacity) {
            gpuEmxEnsureCapacity_real_T(cpu_X, &gpu_X, true);
          }
          X_needsGpuEnsureCapacity = false;
          if (X_best_needsGpuEnsureCapacity) {
            gpuEmxEnsureCapacity_real_T(cpu_X_best, &gpu_X_best, true);
          }
          X_best_needsGpuEnsureCapacity = false;
          gpuEmxEnsureCapacity_real_T(cpu_X_new, &gpu_X_new, true);
          X_new_needsGpuEnsureCapacity = false;
          validLaunchParams = mwValidateLaunchParameters(grid, block);
          if (validLaunchParams) {
            u_parrot_optimizer_animated_ker<<<grid, block>>>(
                St, t2, gpu_X, b_i, gpu_X_best, vlen, gpu_X_new,
                cpu_X->size[0U]);
          }
          cudaDeviceSynchronize();
          checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
          p = false;
        } else {
          if (X_outdatedOnCpu) {
            gpuEmxMemcpyGpuToCpu_real_T(cpu_X, &gpu_X);
          }
          X_outdatedOnCpu = false;
          if (X_best_outdatedOnCpu) {
            gpuEmxMemcpyGpuToCpu_real_T(cpu_X_best, &gpu_X_best);
          }
          X_best_outdatedOnCpu = false;
          binary_expand_op_4(cpu_X_new, cpu_X, b_i, t2, cpu_X_best, St);
          p = true;
          X_best_needsGpuEnsureCapacity = true;
          X_needsGpuEnsureCapacity = true;
          X_new_needsGpuEnsureCapacity = true;
        }
      }
      //  边界约束
      i = cpu_maxval->size[0] * cpu_maxval->size[1];
      cpu_maxval->size[0] = 1;
      cpu_maxval->size[1] = cpu_X_new->size[1];
      emxEnsureCapacity_real_T(cpu_maxval, i, &p_emlrtRTEI);
      npages = cpu_X_new->size[1];
      mwGetLaunchParameters1D(computeNumIters(npages - 1), &grid, &block,
                              2147483647U);
      if (X_new_needsGpuEnsureCapacity) {
        gpuEmxEnsureCapacity_real_T(cpu_X_new, &gpu_X_new, !p);
      }
      gpuEmxEnsureCapacity_real_T(cpu_maxval, &gpu_maxval, true);
      if (p) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_X_new, cpu_X_new);
      }
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        k_parrot_optimizer_animated_ker<<<grid, block>>>(
            lb, gpu_X_new, npages - 1, gpu_maxval);
      }
      cudaDeviceSynchronize();
      checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
      i = cpu_X_new->size[0] * cpu_X_new->size[1];
      cpu_X_new->size[0] = 1;
      cpu_X_new->size[1] = cpu_maxval->size[1];
      emxEnsureCapacity_real_T(cpu_X_new, i, &p_emlrtRTEI);
      npages = cpu_maxval->size[1];
      mwGetLaunchParameters1D(computeNumIters(npages - 1), &grid, &block,
                              2147483647U);
      gpuEmxEnsureCapacity_real_T(cpu_X_new, &gpu_X_new, true);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        l_parrot_optimizer_animated_ker<<<grid, block>>>(ub, gpu_maxval,
                                                         npages - 1, gpu_X_new);
      }
      cudaDeviceSynchronize();
      checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
      //  贪婪选择
      //  输入：x为N×2矩阵，每行代表一个个体（二维）
      //  输出：N×1向量，每个个体的适应度值
      St = 0.0;
      t2 = 0.0;
      gpuEmxMemcpyGpuToCpu_real_T(cpu_X_new, &gpu_X_new);
      d2 = cpu_X_new->data[0];
      d3 = cpu_X_new->data[1];
      for (npages = 0; npages < 5; npages++) {
        St += (static_cast<real_T>(npages) + 1.0) *
              std::cos(((static_cast<real_T>(npages) + 1.0) + 1.0) * d2 +
                       (static_cast<real_T>(npages) + 1.0));
        t2 += (static_cast<real_T>(npages) + 1.0) *
              std::cos(((static_cast<real_T>(npages) + 1.0) + 1.0) * d3 +
                       (static_cast<real_T>(npages) + 1.0));
      }
      St *= t2;
      if (St < cpu_fitness->data[b_i]) {
        npages = cpu_X->size[1];
        mwGetLaunchParameters1D(computeNumIters(npages - 1), &grid, &block,
                                2147483647U);
        gpuEmxEnsureCapacity_real_T(cpu_X_new, &gpu_X_new, true);
        if (X_needsGpuEnsureCapacity) {
          gpuEmxEnsureCapacity_real_T(cpu_X, &gpu_X, true);
        }
        X_needsGpuEnsureCapacity = false;
        validLaunchParams = mwValidateLaunchParameters(grid, block);
        if (validLaunchParams) {
          m_parrot_optimizer_animated_ker<<<grid, block>>>(
              gpu_X_new, b_i, npages - 1, gpu_X, cpu_X->size[0U]);
        }
        cudaDeviceSynchronize();
        checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
        X_outdatedOnCpu = true;
        cpu_fitness->data[b_i] = St;
      }
    }
    //  更新全局最优
    npages = 0;
    vlen = cpu_fitness->size[0];
    St = cpu_fitness->data[0];
    for (b_i = 0; b_i <= vlen - 2; b_i++) {
      if (std::isnan(cpu_fitness->data[b_i + 1])) {
        p = false;
      } else if (std::isnan(St)) {
        p = true;
      } else {
        p = (St > cpu_fitness->data[b_i + 1]);
      }
      if (p) {
        St = cpu_fitness->data[b_i + 1];
        npages = b_i + 1;
      }
    }
    if (St < ex) {
      ex = St;
      i = cpu_X_best->size[0] * cpu_X_best->size[1];
      cpu_X_best->size[0] = 1;
      cpu_X_best->size[1] = cpu_X->size[1];
      emxEnsureCapacity_real_T(cpu_X_best, i, &l_emlrtRTEI);
      vlen = cpu_X->size[1] - 1;
      mwGetLaunchParameters1D(computeNumIters(vlen), &grid, &block,
                              2147483647U);
      if (X_needsGpuEnsureCapacity) {
        gpuEmxEnsureCapacity_real_T(cpu_X, &gpu_X, true);
      }
      X_needsGpuEnsureCapacity = false;
      gpuEmxEnsureCapacity_real_T(cpu_X_best, &gpu_X_best, true);
      X_best_needsGpuEnsureCapacity = false;
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        v_parrot_optimizer_animated_ker<<<grid, block>>>(
            gpu_X, npages, vlen, gpu_X_best, cpu_X->size[0U]);
      }
      cudaDeviceSynchronize();
      checkCudaError(cudaGetLastError(), __FILE__, __LINE__);
      X_best_outdatedOnCpu = true;
    }
    Convergence_curve->data[t] = ex;
  }
  emxFree_real_T(&cpu_dv5);
  emxFree_real_T(&e_cpu_y);
  emxFree_real_T(&d_cpu_y);
  emxFree_real_T(&cpu_maxval);
  emxFree_real_T(&cpu_dv4);
  emxFree_real_T(&c_cpu_y);
  emxFree_real_T(&b_cpu_y);
  emxFree_real_T(&e_cpu_r);
  emxFree_real_T(&cpu_X_new);
  emxFree_real_T(&cpu_v);
  emxFree_real_T(&d_cpu_r);
  emxFree_real_T(&c_cpu_r);
  emxFree_real_T(&b_cpu_r);
  emxFree_real_T(&cpu_X_mean);
  emxFree_real_T(&cpu_y);
  emxFree_real_T(&cpu_fitness);
  emxFree_real_T(&cpu_X);
  *f_best = ex;
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  if (X_best_outdatedOnCpu) {
    gpuEmxMemcpyGpuToCpu_real_T(cpu_X_best, &gpu_X_best);
  }
  gpuEmxFree_real_T(&gpu_X_best);
  gpuEmxFree_real_T(&gpu_r);
  gpuEmxFree_real_T(&gpu_X);
  gpuEmxFree_real_T(&gpu_fitness);
  gpuEmxFree_real_T(&gpu_y);
  gpuEmxFree_real_T(&gpu_X_mean);
  gpuEmxFree_real_T(&c_gpu_r);
  gpuEmxFree_real_T(&b_gpu_r);
  gpuEmxFree_real_T(&e_gpu_r);
  gpuEmxFree_real_T(&gpu_v);
  gpuEmxFree_real_T(&gpu_X_new);
  gpuEmxFree_real_T(&d_gpu_r);
  gpuEmxFree_real_T(&d_gpu_y);
  gpuEmxFree_real_T(&b_gpu_y);
  gpuEmxFree_real_T(&gpu_dv4);
  gpuEmxFree_real_T(&gpu_maxval);
  gpuEmxFree_real_T(&e_gpu_y);
  gpuEmxFree_real_T(&c_gpu_y);
  gpuEmxFree_real_T(&gpu_dv5);
}

// End of code generation (parrot_optimizer_animated.cu)
