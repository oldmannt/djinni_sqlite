##this is an example to use djinni for ios and android

follow this article:
http://mobilecpptutorials.com/your-first-cross-platform-djinni-app-part-1-cplusplus/ 

#1.down djinni and gyp
>$ git submodule add https://github.com/dropbox/djinni.git deps/djinni
$ git submodule add https://chromium.googlesource.com/external/gyp.git deps/gyp
gyp need to set to an older version
$ cd deps/gyp
$ git checkout -q 0bb67471bca068996e15b56738fa4824dfa19de0

#2.genrate the interactive code
>edit the djinni for c++ interface helloworld.djinni
edit the sh script, run_djinni.sh
$  sh ./ run_djinni.sh

#3.genrate the ios project
>edit libhelloworld.gyp
edit Mkefile
$ make ios

#4.modify the ios project
>delete jni src and jni config
add libraries libhelloworld_objc.a and libdjinni_objc.a
add User header Search Paths" 
  $(SRCROOT)/../../deps/djinni/support-lib/objc
  $(SRCROOT)/../../generated-src/objc
in swift project need to add a empty cpp file to enable c++ librarie support
in objectc need to modify main.m to main.mm

#5.android project
>http://mobilecpptutorials.com/your-first-cross-platform-djinni-app-part-3-android/
android has more holes than ios
error: 'mutex' in namespace 'std' does not name a type
cppFlags.add(“-D_GLIBCXX_HAS_GTHREADS”)
if don't find "app-native" in Run/Debug Configuration, just reopen Android Studio

#more infomation
http://tools.android.com/tech-docs/new-build-system/gradle-experimental?pli=1#TOC-Gradle-Requirements
https://codelabs.developers.google.com/codelabs/android-studio-jni/index.html?index=..%2F..%2Findex#0
