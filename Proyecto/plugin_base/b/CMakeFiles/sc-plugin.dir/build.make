# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base/b

# Include any dependencies generated for this target.
include CMakeFiles/sc-plugin.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sc-plugin.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sc-plugin.dir/flags.make

CMakeFiles/sc-plugin.dir/plugin_main.cpp.o: CMakeFiles/sc-plugin.dir/flags.make
CMakeFiles/sc-plugin.dir/plugin_main.cpp.o: ../plugin_main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base/b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/sc-plugin.dir/plugin_main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sc-plugin.dir/plugin_main.cpp.o -c /home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base/plugin_main.cpp

CMakeFiles/sc-plugin.dir/plugin_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sc-plugin.dir/plugin_main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base/plugin_main.cpp > CMakeFiles/sc-plugin.dir/plugin_main.cpp.i

CMakeFiles/sc-plugin.dir/plugin_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sc-plugin.dir/plugin_main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base/plugin_main.cpp -o CMakeFiles/sc-plugin.dir/plugin_main.cpp.s

# Object files for target sc-plugin
sc__plugin_OBJECTS = \
"CMakeFiles/sc-plugin.dir/plugin_main.cpp.o"

# External object files for target sc-plugin
sc__plugin_EXTERNAL_OBJECTS =

libsc-plugin.so: CMakeFiles/sc-plugin.dir/plugin_main.cpp.o
libsc-plugin.so: CMakeFiles/sc-plugin.dir/build.make
libsc-plugin.so: CMakeFiles/sc-plugin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base/b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libsc-plugin.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sc-plugin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sc-plugin.dir/build: libsc-plugin.so

.PHONY : CMakeFiles/sc-plugin.dir/build

CMakeFiles/sc-plugin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sc-plugin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sc-plugin.dir/clean

CMakeFiles/sc-plugin.dir/depend:
	cd /home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base/b && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base /home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base /home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base/b /home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base/b /home/joel/Proyecto_Orga_Archivos/Proyecto/plugin_base/b/CMakeFiles/sc-plugin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sc-plugin.dir/depend
