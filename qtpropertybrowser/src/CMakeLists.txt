
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(sources
        qtbuttonpropertybrowser.cpp
        qteditorfactory.cpp
        qtgroupboxpropertybrowser.cpp
        qtpropertybrowser.cpp
        qtpropertybrowserutils.cpp
        qtpropertymanager.cpp
        qttreepropertybrowser.cpp
        qtvariantproperty.cpp
        )

set(moc_sources
        qtpropertybrowserutils_p.h
        )

set(ui_forms
        )

set(resources
        qtpropertybrowser.qrc
        )

qt5_wrap_ui(ui_cpp ${ui_forms})
qt5_wrap_cpp(moc_cpp ${moc_sources})
qt5_add_resources(qrc_srcs ${resources})
configure_target_qt(${libname} ${sources} ${moc_sources} ${ui_forms} ${resources})

set( headers_moc
        qtbuttonpropertybrowser.h
        qteditorfactory.h
        qtgroupboxpropertybrowser.h
        qtpropertybrowser.h
        qtpropertybrowserutils_p.h
        qtpropertymanager.h
        qttreepropertybrowser.h
        qtvariantproperty.h
        )

set(libname qtpropertybrowser)
add_library(${libname} STATIC ${sources} ${ui_cpp} ${moc_cpp} ${qrc_srcs} )
configure_target(${libname})

set(moc_cpp)
FOREACH(file ${headers_moc})
    get_filename_component(filename_we ${file} NAME_WE)
    set(output_file moc_${filename_we}.cpp)
    QT5_GENERATE_MOC(${file} ${output_file})
    LIST(APPEND moc_cpp ${output_file})
ENDFOREACH()

set(srcs_moc
        qteditorfactory.cpp
        qtpropertymanager.cpp
        qttreepropertybrowser.cpp
        )

FOREACH(file ${srcs_moc})
    get_filename_component(filename_we ${file} NAME_WE)
    set(output_file ${filename_we}.moc)
    QT5_GENERATE_MOC(${file} ${output_file})
    LIST(APPEND moc_cpp ${output_file})
ENDFOREACH()


if(MSVC)
   target_compile_options(${libname} PRIVATE /W4 /WX /wd4389 /wd4456 /wd4457 /wd4127)
endif()

add_custom_target(${libname}GenerateMoc
        DEPENDS ${moc_cpp}
        )
add_dependencies(${libname} ${libname}GenerateMoc)


