string(CONCAT shacl.cmake.Fortran.Standard.generator
  "$<$<STREQUAL:$<TARGET_PROPERTY:Fortran_STANDARD>,95>:f95>"
  "$<$<STREQUAL:$<TARGET_PROPERTY:Fortran_STANDARD>,2003>:f2003>"
  "$<$<STREQUAL:$<TARGET_PROPERTY:Fortran_STANDARD>,2008>:f2008>"
  "$<$<STREQUAL:$<TARGET_PROPERTY:Fortran_STANDARD>,2018>:"
    "$<IF:$<VERSION_LESS:${CMAKE_Fortran_COMPILER_VERSION},8>,f2008ts,f2018>>")

string(CONCAT generator
  "$<$<STREQUAL:GNU,${CMAKE_Fortran_COMPILER_ID}>:"
    "-std=${shacl.cmake.Fortran.Standard.generator}>")

target_compile_options(shacl::cmake::Fortran::Standard INTERFACE
  ${shacl.cmake.Fortran.Standard.generator})

unset(shacl.cmake.Fortran.Standard.generator)
