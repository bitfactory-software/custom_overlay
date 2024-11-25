
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bitfactory-software/virtual_void
    REF "${VERSION}"
    SHA512 41f26ced4b875278888b0d574edd422c0c22b866286df6b35273910543484aaf4f9f47772d187c59129695d5f4eb82ca8d861a4ccb3203c76faa1e93e6ca90f2
)


vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)
#vcpkg_cmake_build()
message("install")
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "virtual_void")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)