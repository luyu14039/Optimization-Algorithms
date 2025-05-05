//
// _coder_parrot_optimizer_animated_mex.h
//
// Code generation for function '_coder_parrot_optimizer_animated_mex'
//

#pragma once

// Include files
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

// Custom Header Code

#ifdef __CUDA_ARCH__
#undef printf
#endif

// Function Declarations
MEXFUNCTION_LINKAGE void mexFunction(int32_T nlhs, mxArray *plhs[],
                                     int32_T nrhs, const mxArray *prhs[]);

emlrtCTX mexFunctionCreateRootTLS();

void unsafe_parrot_optimizer_animated_mexFunction(int32_T nlhs,
                                                  mxArray *plhs[4],
                                                  int32_T nrhs,
                                                  const mxArray *prhs[5]);

// End of code generation (_coder_parrot_optimizer_animated_mex.h)
