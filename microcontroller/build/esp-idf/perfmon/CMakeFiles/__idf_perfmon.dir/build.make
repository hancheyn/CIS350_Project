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
include esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/flags.make

esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.obj: esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/flags.make
esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.obj: ../../../../components/perfmon/xtensa_perfmon_access.c
esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.obj: esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.obj"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.obj -MF CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.obj.d -o CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.obj -c /Users/austinellsworth/esp/esp-idf/components/perfmon/xtensa_perfmon_access.c

esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.i"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/austinellsworth/esp/esp-idf/components/perfmon/xtensa_perfmon_access.c > CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.i

esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.s"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/austinellsworth/esp/esp-idf/components/perfmon/xtensa_perfmon_access.c -o CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.s

esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.obj: esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/flags.make
esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.obj: ../../../../components/perfmon/xtensa_perfmon_apis.c
esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.obj: esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.obj"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.obj -MF CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.obj.d -o CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.obj -c /Users/austinellsworth/esp/esp-idf/components/perfmon/xtensa_perfmon_apis.c

esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.i"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/austinellsworth/esp/esp-idf/components/perfmon/xtensa_perfmon_apis.c > CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.i

esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.s"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/austinellsworth/esp/esp-idf/components/perfmon/xtensa_perfmon_apis.c -o CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.s

esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.obj: esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/flags.make
esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.obj: ../../../../components/perfmon/xtensa_perfmon_masks.c
esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.obj: esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.obj"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.obj -MF CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.obj.d -o CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.obj -c /Users/austinellsworth/esp/esp-idf/components/perfmon/xtensa_perfmon_masks.c

esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.i"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/austinellsworth/esp/esp-idf/components/perfmon/xtensa_perfmon_masks.c > CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.i

esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.s"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon && /Users/austinellsworth/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/austinellsworth/esp/esp-idf/components/perfmon/xtensa_perfmon_masks.c -o CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.s

# Object files for target __idf_perfmon
__idf_perfmon_OBJECTS = \
"CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.obj" \
"CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.obj" \
"CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.obj"

# External object files for target __idf_perfmon
__idf_perfmon_EXTERNAL_OBJECTS =

esp-idf/perfmon/libperfmon.a: esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_access.c.obj
esp-idf/perfmon/libperfmon.a: esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_apis.c.obj
esp-idf/perfmon/libperfmon.a: esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/xtensa_perfmon_masks.c.obj
esp-idf/perfmon/libperfmon.a: esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/build.make
esp-idf/perfmon/libperfmon.a: esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C static library libperfmon.a"
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon && $(CMAKE_COMMAND) -P CMakeFiles/__idf_perfmon.dir/cmake_clean_target.cmake
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_perfmon.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/build: esp-idf/perfmon/libperfmon.a
.PHONY : esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/build

esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/clean:
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon && $(CMAKE_COMMAND) -P CMakeFiles/__idf_perfmon.dir/cmake_clean.cmake
.PHONY : esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/clean

esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/depend:
	cd /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world /Users/austinellsworth/esp/esp-idf/components/perfmon /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon /Users/austinellsworth/esp/esp-idf/examples/get-started/hello_world/build/esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/perfmon/CMakeFiles/__idf_perfmon.dir/depend

