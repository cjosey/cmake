include(Backports/IncludeGuard)
include_guard(GLOBAL)

define_property(TARGET PROPERTY Intel_FLOATING_POINT_MODEL
BRIEF_DOCS
"Intel Fortran floating point model"
FULL_DOCS
"This property specifies the Intel floating-point model to apply.
Options are: precise, fast[=1|2], consistent, strict, source"
)

add_library(Fortran_IntelFPModel INTERFACE)
add_library(FortranCompileOptions::IntelFPModel ALIAS Fortran_IntelFPModel)

string(CONCAT generator
  "$<$<BOOL:$<TARGET_PROPERTY:Intel_FLOATING_POINT_MODEL>>:"
    "$<$<STREQUAL:Intel,${CMAKE_Fortran_COMPILER_ID}>:"
      "$<$<NOT:$<PLATFORM_ID:Windows>>:-fp-model;$<TARGET_PROPERTY:Intel_FLOATING_POINT_MODEL>>"
      "$<$<PLATFORM_ID:Windows>:/fp:$<TARGET_PROPERTY:Intel_FLOATING_POINT_MODEL>>"
    ">"
  ">"
)

target_compile_options(Fortran_IntelFPModel INTERFACE ${generator})