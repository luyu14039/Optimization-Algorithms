//
// _coder_parrot_optimizer_animated_api.cu
//
// Code generation for function '_coder_parrot_optimizer_animated_api'
//

// Include files
#include "_coder_parrot_optimizer_animated_api.h"
#include "parrot_optimizer_animated.h"
#include "parrot_optimizer_animated_data.h"
#include "parrot_optimizer_animated_emxutil.h"
#include "parrot_optimizer_animated_types.h"
#include "rt_nonfinite.h"

// Variable Definitions
static emlrtRTEInfo hb_emlrtRTEI{
    1,                                      // lineNo
    1,                                      // colNo
    "_coder_parrot_optimizer_animated_api", // fName
    ""                                      // pName
};

// Function Declarations
static real_T b_emlrt_marshallIn(const mxArray *src,
                                 const emlrtMsgIdentifier *msgId);

static const mxArray *b_emlrt_marshallOut(const emxArray_real_T *u);

static real_T emlrt_marshallIn(const mxArray *b_nullptr,
                               const char_T *identifier);

static real_T emlrt_marshallIn(const mxArray *u,
                               const emlrtMsgIdentifier *parentId);

static const mxArray *emlrt_marshallOut(const emxArray_real_T *u);

static const mxArray *emlrt_marshallOut(const real_T u);

static const mxArray *emlrt_marshallOut(const emxArray_cell_wrap_0 *u);

// Function Definitions
static real_T b_emlrt_marshallIn(const mxArray *src,
                                 const emlrtMsgIdentifier *msgId)
{
  static const int32_T dims{0};
  real_T ret;
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src, "double", false, 0U,
                          (const void *)&dims);
  ret = *static_cast<real_T *>(emlrtMxGetData(src));
  emlrtDestroyArray(&src);
  return ret;
}

static const mxArray *b_emlrt_marshallOut(const emxArray_real_T *u)
{
  static const int32_T iv[1]{0};
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateNumericArray(1, (const void *)&iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, &u->data[0]);
  emlrtSetDimensions((mxArray *)m, &u->size[0], 1);
  emlrtAssign(&y, m);
  return y;
}

static real_T emlrt_marshallIn(const mxArray *b_nullptr,
                               const char_T *identifier)
{
  emlrtMsgIdentifier thisId;
  real_T y;
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = emlrt_marshallIn(emlrtAlias(b_nullptr), &thisId);
  emlrtDestroyArray(&b_nullptr);
  return y;
}

static real_T emlrt_marshallIn(const mxArray *u,
                               const emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = b_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static const mxArray *emlrt_marshallOut(const emxArray_real_T *u)
{
  static const int32_T iv[2]{0, 0};
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateNumericArray(2, (const void *)&iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, &u->data[0]);
  emlrtSetDimensions((mxArray *)m, &u->size[0], 2);
  emlrtAssign(&y, m);
  return y;
}

static const mxArray *emlrt_marshallOut(const real_T u)
{
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateDoubleScalar(u);
  emlrtAssign(&y, m);
  return y;
}

static const mxArray *emlrt_marshallOut(const emxArray_cell_wrap_0 *u)
{
  const mxArray *b_y;
  const mxArray *m;
  const mxArray *y;
  real_T *pData;
  int32_T iv[2];
  int32_T n;
  y = nullptr;
  emlrtAssign(&y, emlrtCreateCellArrayR2014a(1, &u->size[0]));
  n = u->size[0];
  for (int32_T i{0}; i < n; i++) {
    int32_T i1;
    int32_T loopUpperBound;
    b_y = nullptr;
    iv[0] = u->data[i].f1->size[0];
    iv[1] = u->data[i].f1->size[1];
    m = emlrtCreateNumericArray(2, &iv[0], mxDOUBLE_CLASS, mxREAL);
    pData = emlrtMxGetPr(m);
    i1 = 0;
    loopUpperBound = u->data[i].f1->size[1];
    for (int32_T b_i{0}; b_i < loopUpperBound; b_i++) {
      int32_T b_loopUpperBound;
      b_loopUpperBound = u->data[i].f1->size[0];
      for (int32_T c_i{0}; c_i < b_loopUpperBound; c_i++) {
        pData[i1 + c_i] =
            u->data[i].f1->data[c_i + u->data[i].f1->size[0] * b_i];
      }
      if (u->data[i].f1->size[0] - 1 >= 0) {
        i1 += u->data[i].f1->size[0];
      }
    }
    emlrtAssign(&b_y, m);
    emlrtSetCell(y, i, b_y);
  }
  return y;
}

void parrot_optimizer_animated_api(const mxArray *const prhs[5], int32_T nlhs,
                                   const mxArray *plhs[4])
{
  emxArray_cell_wrap_0 *all_positions;
  emxArray_real_T *Convergence_curve;
  emxArray_real_T *X_best;
  real_T Max_iter;
  real_T N;
  real_T dim;
  real_T f_best;
  real_T lb;
  real_T ub;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  // Marshall function inputs
  N = emlrt_marshallIn(emlrtAliasP(prhs[0]), "N");
  Max_iter = emlrt_marshallIn(emlrtAliasP(prhs[1]), "Max_iter");
  lb = emlrt_marshallIn(emlrtAliasP(prhs[2]), "lb");
  ub = emlrt_marshallIn(emlrtAliasP(prhs[3]), "ub");
  dim = emlrt_marshallIn(emlrtAliasP(prhs[4]), "dim");
  // Invoke the target function
  emxInit_real_T(&X_best, 2, &hb_emlrtRTEI, true);
  emxInit_real_T(&Convergence_curve, 1, &hb_emlrtRTEI, true);
  emxInit_cell_wrap_0(&all_positions, 1, &hb_emlrtRTEI, true);
  parrot_optimizer_animated(N, Max_iter, lb, ub, dim, X_best, &f_best,
                            Convergence_curve, all_positions);
  // Marshall function outputs
  X_best->canFreeData = false;
  plhs[0] = emlrt_marshallOut(X_best);
  emxFree_real_T(&X_best);
  if (nlhs > 1) {
    plhs[1] = emlrt_marshallOut(f_best);
  }
  if (nlhs > 2) {
    Convergence_curve->canFreeData = false;
    plhs[2] = b_emlrt_marshallOut(Convergence_curve);
  }
  emxFree_real_T(&Convergence_curve);
  if (nlhs > 3) {
    plhs[3] = emlrt_marshallOut(all_positions);
  }
  emxFree_cell_wrap_0(&all_positions);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
}

// End of code generation (_coder_parrot_optimizer_animated_api.cu)
