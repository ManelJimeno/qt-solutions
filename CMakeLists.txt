cmake_minimum_required(VERSION 3.0.0)
project(fluid LANGUAGES CXX)
set (CMAKE_CXX_STANDARD 11)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

option(BUILD_EXAMPLES "Build examples" OFF)

find_package(Qt5 5.11 COMPONENTS Widgets Gui Core REQUIRED)
include_directories(${Qt5Gui_INCLUDE_DIRS} ${Qt5Widgets_INCLUDE_DIRS})

include(ConfigTarget)

add_subdirectory(qtpropertybrowser)
