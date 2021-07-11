# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.20.5/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.20.5/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build

# Utility rule file for bootloader-flash.

# Include any custom commands dependencies for this target.
include esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/progress.make

esp-idf/bootloader/CMakeFiles/bootloader-flash:
	cd /Users/austinellsworth/esp/esp-idf/components/bootloader && /usr/local/Cellar/cmake/3.20.5/bin/cmake -D IDF_PATH="/Users/austinellsworth/esp/esp-idf" -D SERIAL_TOOL="/Users/austinellsworth/.espressif/python_env/idf4.4_py3.9_env/bin/python /Users/austinellsworth/esp/esp-idf/components/esptool_py/esptool/esptool.py --chip esp32" -D SERIAL_TOOL_ARGS="--before=default_reset --after=hard_reset write_flash @bootloader-flash_args" -D WORKING_DIRECTORY="/Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build" -P /Users/austinellsworth/esp/esp-idf/components/esptool_py/run_serial_tool.cmake

bootloader-flash: esp-idf/bootloader/CMakeFiles/bootloader-flash
bootloader-flash: esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/build.make
.PHONY : bootloader-flash

# Rule to build all files generated by this target.
esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/build: bootloader-flash
.PHONY : esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/build

esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/clean:
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/bootloader && $(CMAKE_COMMAND) -P CMakeFiles/bootloader-flash.dir/cmake_clean.cmake
.PHONY : esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/clean

esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/depend:
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world /Users/austinellsworth/esp/esp-idf/components/bootloader /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/bootloader /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/depend

