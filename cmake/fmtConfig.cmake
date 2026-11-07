# ****************************************************************************
#  Project:  LibCMaker
#  Purpose:  A CMake build scripts for build libraries with CMake
#  Author:   NikitaFeodonit, nfeodonit@yandex.com
# ****************************************************************************
#    Copyright (c) 2017-2026 NikitaFeodonit
#
#    This file is part of the LibCMaker project.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published
#    by the Free Software Foundation, either version 3 of the License,
#    or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#    See the GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program. If not, see <http://www.gnu.org/licenses/>.
# ****************************************************************************


#-----------------------------------------------------------------------
# Library version
#

set(fmt_lib_VERSION "12.2.0" CACHE STRING "fmt_lib_VERSION")
set(fmt_sha256
  "a2f4a8d51178f954e4c339007f77edd76ba0cb2e36f87a48e5a5403d9be5878f"
  CACHE STRING "fmt_sha256"
)


#-----------------------------------------------------------------------
# fmt options
#

option(FMT_DOC "Generate the doc target." OFF)
option(FMT_INSTALL "Generate the install target." ON)
option(FMT_TEST "Generate the test target." OFF)
option(FMT_FUZZ "Generate the fuzz target." OFF)
option(FMT_CUDA_TEST "Generate the cuda-test target." OFF)
option(FMT_OS "Include OS-specific APIs." ON)
option(FMT_MODULE "Build a module library." OFF)
option(FMT_SYSTEM_HEADERS "Expose headers with marking them as system." OFF)
option(FMT_UNICODE "Enable Unicode support." ON)
option(FMT_PEDANTIC "Enable extra warnings and expensive tests." OFF)
option(FMT_WERROR
  "Halt the compilation with an error on compiler warnings."
  OFF
)


#-----------------------------------------------------------------------
# Unpack, configure and build the required libraries
#

include(FetchContent)

FetchContent_Declare(
  fmt
  URL ${CMAKE_CURRENT_LIST_DIR}/source/fmt-${fmt_lib_VERSION}.zip
  URL_HASH SHA256=${fmt_sha256}
  OVERRIDE_FIND_PACKAGE
)

FetchContent_MakeAvailable(fmt)
