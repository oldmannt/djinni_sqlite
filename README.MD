##this is an example to use djinni for ios and android

follow this article:   
http://mobilecpptutorials.com/your-first-cross-platform-djinni-app-part-1-cplusplus/ 

####1.down djinni and gyp  
	$ git submodule add https://github.com/dropbox/djinni.git deps/djinni
	$ git submodule add https://chromium.googlesource.com/external/gyp.git deps/gyp
gyp need to set to an older version

	$ cd deps/gyp
	$ git checkout -q 0bb67471bca068996e15b56738fa4824dfa19de0
copy /sqlite3 and sqite3.gyp to deps/  
####2.genrate the interactive code   
edit the djinni for c++ interface djinni_sqlite.djinni  
add an interface that implement in swift or jave

    my_client_interface = interface +j +o {
        log_string(str: string): bool;
    }

edit the sh script, run_djinni.sh   

    $  sh ./ run_djinni.sh

create swift file to implement my_client_interface  
####3.genrate the ios project
edit djinni_sqlite.gyp
to genrate .dylib target  

    "type": "shared_library",

create a xcode workspace in /ios_project and   
a xcode iphone project in /ios_project  
to import dylib in swift file, "SWIFT_MODULE_NAME" is the project target genrate above

    "import $(SWIFT_MODULE_NAME)" in the swift file
    
edit Mkefile

	$ make ios

####4.modify the ios project  
int eh iphone project
add libraries libhelloworld_objc.a and libdjinni_objc.a  
add User header Search Paths" 

	$(SRCROOT)/../../deps/djinni/support-lib/objc
	$(SRCROOT)/../../generated-src/objc

import the 	
in swift project need to add a empty cpp file to enable c++ librarie support 
####5.android project  
http://mobilecpptutorials.com/todo-app-using-djinni-and-sqlite-part-3-android/
android has more holes than ios  
error: 'mutex' in namespace 'std' does not name a type  

    cppFlags.add(“-D_GLIBCXX_HAS_GTHREADS”)  
if don't find "app-native" in Run/Debug Configuration, just reopen Android Studio

####more infomation  
http://tools.android.com/tech-docs/new-build-system/gradle-experimental?pli=1#TOC-Gradle-Requirements  
https://codelabs.developers.google.com/codelabs/android-studio-jni/index.html?index=..%2F..%2Findex#0  
