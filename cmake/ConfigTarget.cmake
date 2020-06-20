###############################################################################
# Configure target build properties
###############################################################################

function(configure_target TARGET_NAME)
    set_target_properties(${TARGET_NAME} PROPERTIES
            CXX_STANDARD 11
            CXX_STANDARD_REQUIRED ON
            CXX_EXTENSIONS OFF
            POSITION_INDEPENDENT_CODE ON)

    if (DO_CLANG_TIDY)
        set_target_properties(${TARGET_NAME} PROPERTIES CXX_CLANG_TIDY "${DO_CLANG_TIDY}")
    endif ()
    if (MSVC)
        target_compile_options(${TARGET_NAME} PRIVATE /W4 /WX /wd4389)
    else ()
        target_compile_options(${TARGET_NAME} PRIVATE -Wall )
    endif ()

    add_definitions(-Dgsl_CONFIG_DEFAULTS_VERSION=1)
endfunction()


function(configure_target_qt target_name sources moc_sources ui_forms resources)



endfunction()