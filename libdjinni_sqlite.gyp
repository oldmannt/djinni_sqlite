{
  "targets": [
    {
      "target_name": "libdjinni_sqlite_objc",
      "type": "shared_library",
      "dependencies": [
        "./deps/djinni/support-lib/support_lib.gyp:djinni_objc",
        "./deps/sqlite3.gyp:sqlite3",
      ],
      "sources": [
        "<!@(python deps/djinni/example/glob.py generated-src/objc  '*.cpp' '*.h' '*.mm' '*.m')",
        "<!@(python deps/djinni/example/glob.py generated-src/cpp   '*.cpp' '*.hpp' '*.h')",
        "<!@(python deps/djinni/example/glob.py src '*.cpp' '*.hpp' '*.h')",
      ],
      "include_dirs": [
        "generated-src/objc",
        "generated-src/cpp",
        "src",
      ]
    },
    {
      "target_name": "libdjinni_sqlite_jni",
      "type": "shared_library",
      "dependencies": [
        "deps/djinni/support-lib/support_lib.gyp:djinni_jni",
        "deps/sqlite3.gyp:sqlite3",
      ],
      "ldflags" : [ "-llog", "-Wl,--build-id,--gc-sections,--exclude-libs,ALL" ],
      "sources": [
        "./deps/djinni/support-lib/jni/djinni_main.cpp",
        "<!@(python deps/djinni/example/glob.py generated-src/jni   '*.cpp')",
        "<!@(python deps/djinni/example/glob.py generated-src/cpp   '*.cpp')",
        "<!@(python deps/djinni/example/glob.py src '*.cpp')",
      ],
      "include_dirs": [
        "generated-src/jni",
        "generated-src/cpp",
        "src",
      ],
    },
  ],
}