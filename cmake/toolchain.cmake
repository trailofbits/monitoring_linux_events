#
# Copyright (c) 2020-present, Trail of Bits, Inc.
# All rights reserved.
#
# This source code is licensed in accordance with the terms specified in
# the LICENSE file found in the root directory of this source tree.
#

if(EXISTS "${SYSPROF_TOOLCHAIN_PATH}")
  set(CMAKE_C_COMPILER "${SYSPROF_TOOLCHAIN_PATH}/usr/bin/clang" CACHE STRING "Forced toolchain setting" FORCE)
  set(CMAKE_CXX_COMPILER "${SYSPROF_TOOLCHAIN_PATH}/usr/bin/clang++" CACHE STRING "Forced toolchain setting" FORCE)
  set(CMAKE_SYSROOT "${SYSPROF_TOOLCHAIN_PATH}" CACHE PATH "Forced toolchain setting" FORCE)
  set(CMAKE_LINK_SEARCH_START_STATIC "ON" CACHE BOOL "Forced toolchain setting" FORCE)
  set(CMAKE_LINK_SEARCH_END_STATIC "ON" CACHE BOOL "Forced toolchain setting" FORCE)
  set(CMAKE_CXX_LINK_NO_PIE_SUPPORTED "TRUE" CACHE INTERNAL "Forced toolchain setting" FORCE)
  set(CMAKE_CXX_LINK_PIE_SUPPORTED "TRUE" CACHE INTERNAL "Forced toolchain setting" FORCE)
  set(CMAKE_C_LINK_NO_PIE_SUPPORTED "TRUE" CACHE INTERNAL "Forced toolchain setting" FORCE)
  set(CMAKE_C_LINK_PIE_SUPPORTED "TRUE" CACHE INTERNAL "Forced toolchain setting" FORCE)

  set(SYSPROF_ENABLE_LIBCPP "TRUE" CACHE BOOL "Forced toolchain setting" FORCE)
endif()
