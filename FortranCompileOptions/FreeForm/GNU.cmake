string(CONCAT generator
  "$<$<STREQUAL:GNU,${CMAKE_Fortran_COMPILER_ID}>:-ffree-form>"
)

target_compile_options(Fortran_FreeForm INTERFACE ${generator})
