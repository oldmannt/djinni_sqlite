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

confige android studio project, refer to  
http://tools.android.com/tech-docs/new-build-system/gradle-experimental?pli=1#TOC-Gradle-Requirements  
http://mobilecpptutorials.com/todo-app-using-djinni-and-sqlite-part-3-android/  
0. set ndk-build PATH  
1. ./gradle/wrapper/gradle-wrapper.properties  

	distributionBase=GRADLE_USER_HOME
	distributionPath=wrapper/dists
	zipStoreBase=GRADLE_USER_HOME
	zipStorePath=wrapper/dists
	distributionUrl=https\://services.gradle.org/distributions/gradle-2.10-all.zip
2. Porject/build.gradle

	//classpath 'com.android.tools.build:gradle:2.1.0' change to below line  
	classpath "com.android.tools.build:gradle-experimental:**0.7.0-alpha4**"
	
3. app/build.gradle  

	apply plugin: 'com.android.**model.**application'
	model {
			...
			defaultConfig.with {
			...
	        minSdkVersion**.apiLevel** 15   
	        targetSdkVersion**.apiLevel** 23   
	        ...
	        buildTypes {
	            release {
	                minifyEnabled false
	                proguardFiles.add(file("proguard-rules.pro"))
	            }
        	}
        	productFlavors {
	            create("arm7") {	// should not be "flavor1"
	                ndk.abiFilters.add("armeabi-v7a")
	            }
	        }
	        ...
	        sources {
            main {
                jni {
                    source {
                        srcDirs = [
                                //cpp code
                        ]
                    }
                }
 
                java {
                    source {
                        srcDirs = [
                                // java code
                        ]
                    }
                }
            }
        }// sources
        ndk {
            // c/c++ flags
            cppFlags.add("-D_GLIBCXX_HAS_GTHREADS")
        }

	    }// model
        
android studio 2.2 preview, I going to try now
http://android-developers.blogspot.com/2016/05/android-studio-22-preview-new-ui.html





http://mobilecpptutorials.com/todo-app-using-djinni-and-sqlite-part-3-android/
android has more holes than ios  
error: 'mutex' in namespace 'std' does not name a type  

    cppFlags.add("-D_GLIBCXX_HAS_GTHREADS")  
if don't find "app-native" in Run/Debug Configuration, just reopen Android Studio

####more infomation  
http://ph0b.com/new-android-studio-ndk-support/  
http://www.slideshare.net/ph0b/mastering-the-ndk-with-android-studio-and-the-gradleexperimental-plugin  
http://tools.android.com/tech-docs/new-build-system/gradle-experimental?pli=1#TOC-Gradle-Requirements  
https://codelabs.developers.google.com/codelabs/android-studio-jni/index.html?index=..%2F..%2Findex#0  
