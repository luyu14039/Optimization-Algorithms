//
// eml_mtimes_helper.cu
//
// Code generation for function 'eml_mtimes_helper'
//

// Include files
#include "eml_mtimes_helper.h"
#include "parrot_optimizer_animated_data.h"
#include "parrot_optimizer_animated_emxutil.h"
#include "parrot_optimizer_animated_types.h"
#include "rt_nonfinite.h"

// Function Definitions
void binary_expand_op_2(emxArray_real_T *in1, real_T in2,
                        const emxArray_real_T *in3, int32_T in4,
                        const emxArray_real_T *in5)
{
  int32_T b;
  int32_T i;
  int32_T stride_0_1;
  int32_T stride_1_1;
  i = in1->size[0] * in1->size[1];
  in1->size[0] = 1;
  if (in5->size[1] == 1) {
    in1->size[1] = in3->size[1];
  } else {
    in1->size[1] = in5->size[1];
  }
  emxEnsureCapacity_real_T(in1, i, &n_emlrtRTEI);
  stride_0_1 = (in3->size[1] != 1);
  stride_1_1 = (in5->size[1] != 1);
  if (in5->size[1] == 1) {
    b = in3->size[1];
  } else {
    b = in5->size[1];
  }
  for (i = 0; i < b; i++) {
    in1->data[i] = in2 * (in3->data[in4 + in3->size[0] * (i * stride_0_1)] -
                          in5->data[i * stride_1_1]);
  }
}

// End of code generation (eml_mtimes_helper.cu)
