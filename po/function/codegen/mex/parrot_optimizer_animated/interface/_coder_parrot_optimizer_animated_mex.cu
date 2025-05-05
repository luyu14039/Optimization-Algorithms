//
// _coder_parrot_optimizer_animated_mex.cu
//
// Code generation for function '_coder_parrot_optimizer_animated_mex'
//

// Include files
#include "_coder_parrot_optimizer_animated_mex.h"
#include "_coder_parrot_optimizer_animated_api.h"
#include "parrot_optimizer_animated_data.h"
#include "parrot_optimizer_animated_initialize.h"
#include "parrot_optimizer_animated_terminate.h"
#include "rt_nonfinite.h"
#include <stdexcept>

void emlrtExceptionBridge();
void emlrtExceptionBridge()
{
  throw std::runtime_error("");
}
// Function Definitions
void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  mexAtExit(&parrot_optimizer_animated_atexit);
  // Module initialization.
  parrot_optimizer_animated_initialize();
  try { // Dispatch the entry-point.
    unsafe_parrot_optimizer_animated_mexFunction(nlhs, plhs, nrhs, prhs);
    // Module termination.
    parrot_optimizer_animated_terminate();
  } catch (...) {
    emlrtCleanupOnException((emlrtCTX *)emlrtRootTLSGlobal);
    throw;
  }
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, nullptr, 1,
                           (void *)&emlrtExceptionBridge, "GBK", true);
  return emlrtRootTLSGlobal;
}

void unsafe_parrot_optimizer_animated_mexFunction(int32_T nlhs,
                                                  mxArray *plhs[4],
                                                  int32_T nrhs,
                                                  const mxArray *prhs[5])
{
  const mxArray *outputs[4];
  int32_T b;
  // Check for proper number of arguments.
  if (nrhs != 5) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal, "EMLRT:runTime:WrongNumberOfInputs",
                        5, 12, 5, 4, 25, "parrot_optimizer_animated");
  }
  if (nlhs > 4) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal,
                        "EMLRT:runTime:TooManyOutputArguments", 3, 4, 25,
                        "parrot_optimizer_animated");
  }
  // Call the function.
  parrot_optimizer_animated_api(prhs, nlhs, outputs);
  // Copy over outputs to the caller.
  if (nlhs < 1) {
    b = 1;
  } else {
    b = nlhs;
  }
  emlrtReturnArrays(b, &plhs[0], &outputs[0]);
}

// End of code generation (_coder_parrot_optimizer_animated_mex.cu)
