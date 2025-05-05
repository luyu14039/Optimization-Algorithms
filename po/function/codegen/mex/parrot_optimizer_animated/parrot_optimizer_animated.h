//
// parrot_optimizer_animated.h
//
// Code generation for function 'parrot_optimizer_animated'
//

#pragma once

// Include files
#include "parrot_optimizer_animated_types.h"
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
void parrot_optimizer_animated(real_T N, real_T Max_iter, real_T lb, real_T ub,
                               real_T dim, emxArray_real_T *cpu_X_best,
                               real_T *f_best,
                               emxArray_real_T *Convergence_curve,
                               emxArray_cell_wrap_0 *all_positions);

// End of code generation (parrot_optimizer_animated.h)
