#
# Copyright (c) 2020-present, Trail of Bits, Inc.
# All rights reserved.
#
# This source code is licensed in accordance with the terms specified in
# the LICENSE file found in the root directory of this source tree.
#

function(importLLVM)
  find_package(LLVM REQUIRED)
  if(NOT TARGET LLVMBPFCodeGen)
    message(FATAL_ERROR "The installed LLVM libraries do not support the BPF codegen target")
  endif()

  add_library(thirdparty_llvm INTERFACE)
  target_link_libraries(thirdparty_llvm INTERFACE
    LLVMMCJIT
    LLVMBPFCodeGen
    LLVMX86CodeGen
  )

  # Ubuntu/Debian workaround
  if(EXISTS "/usr/include/llvm-${LLVM_VERSION_MAJOR}")
    list(APPEND LLVM_INCLUDE_DIRS "/usr/include/llvm-${LLVM_VERSION_MAJOR}")
  endif()

  target_include_directories(thirdparty_llvm SYSTEM INTERFACE
    ${LLVM_INCLUDE_DIRS}
  )

  target_compile_definitions(thirdparty_llvm INTERFACE
    ${LLVM_DEFINITIONS}
    LLVM_VERSION_MAJOR=${LLVM_VERSION_MAJOR}
    LLVM_VERSION_MINOR=${LLVM_VERSION_MINOR}
  )
endfunction()

importLLVM()
