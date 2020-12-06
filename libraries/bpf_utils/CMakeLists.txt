#
# Copyright (c) 2020-present, Trail of Bits, Inc.
# All rights reserved.
#
# This source code is licensed in accordance with the terms specified in
# the LICENSE file found in the root directory of this source tree.
#

add_library(bpf_utils INTERFACE)
target_include_directories(bpf_utils INTERFACE include)

target_link_libraries(bpf_utils INTERFACE
  cxx_target_settings
  thirdparty_llvm
)
