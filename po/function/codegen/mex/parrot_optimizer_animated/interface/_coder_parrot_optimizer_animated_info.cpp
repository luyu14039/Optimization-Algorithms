//
// _coder_parrot_optimizer_animated_info.cpp
//
// Code generation for function 'parrot_optimizer_animated'
//

// Include files
#include "_coder_parrot_optimizer_animated_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

// Function Declarations
static const mxArray *c_emlrtMexFcnResolvedFunctionsI();

// Function Definitions
static const mxArray *c_emlrtMexFcnResolvedFunctionsI()
{
  const mxArray *nameCaptureInfo;
  const char_T *data[5]{
      "789cdd544d4ec240149e1afc498cc8caad07309a185d1863621015410412eaca1a68cb00"
      "039d99d24e1bf4125ec1a54be31d4c3c803befe15a4b5b4a9b4c2034"
      "2981b779fde67b33df376f9a0784c29d0000480337be36ddbce5e18c97574038a2bc10a9"
      "13c2e56015a442fb7cfec5cb2a250c0e980b888ce1686793624464c2",
      "c4271d02039a54b36173c8b490064584616d1c941d84afc7a8117028e73bd7816aaf6661"
      "6074ccc0a1360e46fd78e7dc3735653fca9c7e6422fcc3d5e3e5a994"
      "2f88f5ff2bea52456708a36799214af6b35a9b1a8875b029e9546a59447596255d360cca"
      "ead42d85465d2608cb0c360f70e05f8fe93f1dc151ff3e8f086248d6",
      "3ccbc17a23a6fe1a57df659ad4523418e8bdc5d4cb71f5c2fc0cef156e91f34860729fb6"
      "a7f41dcd41fdc6307f7ffc0849eaed967ebb49eaf9312fbd01e7bc69"
      "ffbb1d8e5e26c29f8866bf5d6915d5acda1f648b37b662aaf022f0519da033c907e0e0a4"
      "ce5ff479db88e97f9debdf65cc8ea54083cd6dbebec6d43be3ea85f9",
      "19dec76b8d3b589775ae9e7feea124f5fc58f6b96a63e518954ae4e88a557b87625eeeda"
      "f7b7b9c59fab7f4c06cf67",
      ""};
  nameCaptureInfo = nullptr;
  emlrtNameCaptureMxArrayR2016a(&data[0], 3040U, &nameCaptureInfo);
  return nameCaptureInfo;
}

mxArray *emlrtMexFcnProperties()
{
  mxArray *xEntryPoints;
  mxArray *xInputs;
  mxArray *xResult;
  const char_T *propFieldName[9]{"Version",
                                 "ResolvedFunctions",
                                 "Checksum",
                                 "EntryPoints",
                                 "CoverageInfo",
                                 "IsPolymorphic",
                                 "PropertyList",
                                 "UUID",
                                 "ClassEntryPointIsHandle"};
  const char_T *epFieldName[8]{
      "Name",     "NumberOfInputs", "NumberOfOutputs", "ConstantInputs",
      "FullPath", "TimeStamp",      "Constructor",     "Visible"};
  xEntryPoints =
      emlrtCreateStructMatrix(1, 1, 8, (const char_T **)&epFieldName[0]);
  xInputs = emlrtCreateLogicalMatrix(1, 5);
  emlrtSetField(xEntryPoints, 0, "Name",
                emlrtMxCreateString("parrot_optimizer_animated"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(5.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(4.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(xEntryPoints, 0, "FullPath",
                emlrtMxCreateString(
                    "D:\\GIT_resp\\Optimization-"
                    "Algorithms\\po\\function\\parrot_optimizer_animated.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(739728.99494212959));
  emlrtSetField(xEntryPoints, 0, "Constructor",
                emlrtMxCreateLogicalScalar(false));
  emlrtSetField(xEntryPoints, 0, "Visible", emlrtMxCreateLogicalScalar(true));
  xResult =
      emlrtCreateStructMatrix(1, 1, 9, (const char_T **)&propFieldName[0]);
  emlrtSetField(xResult, 0, "Version",
                emlrtMxCreateString("24.1.0.2537033 (R2024a)"));
  emlrtSetField(xResult, 0, "ResolvedFunctions",
                (mxArray *)c_emlrtMexFcnResolvedFunctionsI());
  emlrtSetField(xResult, 0, "Checksum",
                emlrtMxCreateString("5pUAra4fODI5riwtT1nj5D"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

// End of code generation (_coder_parrot_optimizer_animated_info.cpp)
