# Monitoring Linux events

## Links
 - [Empire Hacking talk](https://youtu.be/9ufYYq5HH_0)
 - Slides: [TODO](https://trailofbits.com)

# Runtime requirements

 - Linux kernel >= 4.15
 - glibc >= 2.12

# Build instructions

## Acquiring the dependencies

Dependency list
 - CMake >= 3.16.2
 - C++ compiler supporting the c++14 standard
 - LLVM libraries built with BPF support enabled

**With system packages, on Ubuntu/Debian-based distributions**

`sudo apt install cmake clang llvm-dev`

**With the osquery-toolchain, on any distribution (preferred)**

The generic [osquery-toolchain](https://github.com/osquery/osquery-toolchain/releases) includes Clang, LLVM and libc++ libraries and can be used instead of the system packages. Both the toolchain itself and the binaries it builds can be run on any distribution above Ubuntu 14.04/CentOS 6 (although this program still requires a Linux kernel >= 4.15).

CMake: download the 'tar.gz' archive from the 'Binary distributions' section. Extract it and add the binary folder to the PATH environment variable.

## How to build

The preferred build method is with the osquery-toolchain

1. Clone the repository
2. Download the [osquery-toolchain](https://github.com/osquery/osquery-toolchain/releases) and extract it
3. Install CMake (use a binary from the [CMake homepage](https://cmake.org) if you are on an old distribution)
4. Create a build directory
5. Configure the project, from within the build folder: `cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DSYSPROF_TOOLCHAIN_PATH=/path/to/osquery/toolchain /path/to/source/folder`
6. Start the build: `cmake --build . -j $(nproc)`

**Example**

```bash
# Install cURL and CMake
sudo apt update && sudo apt install curl cmake -y

# Download and extract the osquery-toolchain
curl -O -L 'https://github.com/osquery/osquery-toolchain/releases/download/1.1.0/osquery-toolchain-1.1.0-x86_64.tar.xz'

tar xf osquery-toolchain-1.1.0-x86_64.tar.xz
export SYSPROF_TOOLCHAIN_PATH="$(realpath osquery-toolchain)"

# Clone the repository
git clone https://github.com/trailofbits/monitoring_linux_events

# Configure the project
mkdir build && cd build
cmake "-DSYSPROF_TOOLCHAIN_PATH=${SYSPROF_TOOLCHAIN_PATH}" ../monitoring_linux_events

# Start the build
cmake --build . -j $(nproc)

# Start the binary
sudo ./syscall_profiler
```
