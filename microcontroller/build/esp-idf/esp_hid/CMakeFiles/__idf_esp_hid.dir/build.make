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

# Include any dependencies generated for this target.
include esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/flags.make

esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.obj: esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/flags.make
esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.obj: ../../../../components/esp_hid/src/esp_hidd.c
esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.obj: esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.obj"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.obj -MF CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.obj.d -o CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.obj -c /Users/austinellsworth/esp/esp-idf/components/esp_hid/src/esp_hidd.c

esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.i"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/austinellsworth/esp/esp-idf/components/esp_hid/src/esp_hidd.c > CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.i

esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.s"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/austinellsworth/esp/esp-idf/components/esp_hid/src/esp_hidd.c -o CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.s

esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.obj: esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/flags.make
esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.obj: ../../../../components/esp_hid/src/esp_hidh.c
esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.obj: esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.obj"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.obj -MF CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.obj.d -o CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.obj -c /Users/austinellsworth/esp/esp-idf/components/esp_hid/src/esp_hidh.c

esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.i"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/austinellsworth/esp/esp-idf/components/esp_hid/src/esp_hidh.c > CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.i

esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.s"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/austinellsworth/esp/esp-idf/components/esp_hid/src/esp_hidh.c -o CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.s

esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.obj: esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/flags.make
esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.obj: ../../../../components/esp_hid/src/esp_hid_common.c
esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.obj: esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.obj"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.obj -MF CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.obj.d -o CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.obj -c /Users/austinellsworth/esp/esp-idf/components/esp_hid/src/esp_hid_common.c

esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.i"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/austinellsworth/esp/esp-idf/components/esp_hid/src/esp_hid_common.c > CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.i

esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.s"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/austinellsworth/esp/esp-idf/components/esp_hid/src/esp_hid_common.c -o CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.s

# Object files for target __idf_esp_hid
__idf_esp_hid_OBJECTS = \
"CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.obj" \
"CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.obj" \
"CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.obj"

# External object files for target __idf_esp_hid
__idf_esp_hid_EXTERNAL_OBJECTS =

esp-idf/esp_hid/libesp_hid.a: esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidd.c.obj
esp-idf/esp_hid/libesp_hid.a: esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hidh.c.obj
esp-idf/esp_hid/libesp_hid.a: esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/src/esp_hid_common.c.obj
esp-idf/esp_hid/libesp_hid.a: esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/build.make
esp-idf/esp_hid/libesp_hid.a: esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C static library libesp_hid.a"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid && $(CMAKE_COMMAND) -P CMakeFiles/__idf_esp_hid.dir/cmake_clean_target.cmake
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_esp_hid.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/build: esp-idf/esp_hid/libesp_hid.a
.PHONY : esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/build

esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/clean:
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid && $(CMAKE_COMMAND) -P CMakeFiles/__idf_esp_hid.dir/cmake_clean.cmake
.PHONY : esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/clean

esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/depend:
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world /Users/austinellsworth/esp/esp-idf/components/esp_hid /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/esp_hid/CMakeFiles/__idf_esp_hid.dir/depend

