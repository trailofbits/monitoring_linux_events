#
# Copyright (c) 2020-present, Trail of Bits, Inc.
# All rights reserved.
#
# This source code is licensed in accordance with the terms specified in
# the LICENSE file found in the root directory of this source tree.
#

cmake_minimum_required(VERSION 3.16.2)

include("cmake/options.cmake")
include("cmake/toolchain.cmake")

project("syscall_profiler")
include("cmake/utils.cmake")

function(syscallProfilerMain)
  generateSettingsTarget()
  add_subdirectory("libraries")

  add_executable("syscall_profiler"
    src/main.cpp
  )

  target_link_libraries("syscall_profiler" PRIVATE
    bpf_utils
  )
endfunction()

syscallProfilerMain()
