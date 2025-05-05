//
// parrot_optimizer_animated_initialize.cu
//
// Code generation for function 'parrot_optimizer_animated_initialize'
//

// Include files
#include "parrot_optimizer_animated_initialize.h"
#include "_coder_parrot_optimizer_animated_mex.h"
#include "parrot_optimizer_animated_data.h"
#include "rt_nonfinite.h"

// Function Definitions
void parrot_optimizer_animated_initialize()
{
  mex_InitInfAndNan();
  emlrtInitGPU(emlrtRootTLSGlobal);
  cudaGetLastError();
  mexFunctionCreateRootTLS();
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, false, 0U, nullptr);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtLicenseCheckR2022a(emlrtRootTLSGlobal,
                          "EMLRT:runTime:MexFunctionNeedsLicense",
                          "distrib_computing_toolbox", 2);
  emlrtLicenseCheckR2022a(emlrtRootTLSGlobal,
                          "EMLRT:runTime:MexFunctionNeedsLicense",
                          "statistics_toolbox", 2);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

// End of code generation (parrot_optimizer_animated_initialize.cu)
