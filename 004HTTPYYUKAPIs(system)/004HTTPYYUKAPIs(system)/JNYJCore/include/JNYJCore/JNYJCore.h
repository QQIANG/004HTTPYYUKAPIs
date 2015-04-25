//
//  Created by William on 2/2/10.
//  Copyright (c) 2010 JNYJ. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "JNYJNSDictionary.h"
#import "JNYJNSString.h"


#import "JNYJBiz.h"
#import "JNYJReachability.h"
#import "JNYJMessageView.h"

#import "JNYJSort.h"

@interface JNYJCore : NSObject

+(void)helloWord;

@end


//# define output folder environment variable
//UNIVERSAL_OUTPUTFOLDER=${BUILD_DIR}/${CONFIGURATION}-universal
//
//# Step 1. Build Device and Simulator versions
//xcodebuild -target JNYJCore ONLY_ACTIVE_ARCH=NO -configuration ${CONFIGURATION} -sdk iphoneos  BUILD_DIR="${BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}"
//xcodebuild -target JNYJCore -configuration ${CONFIGURATION} -sdk iphonesimulator -arch i386 BUILD_DIR="${BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}"
//
//# make sure the output directory exists
//mkdir -p "${UNIVERSAL_OUTPUTFOLDER}"
//
//# Step 2. Create universal binary file using lipo
//lipo -create -output "${UNIVERSAL_OUTPUTFOLDER}/lib${PROJECT_NAME}.a" "${BUILD_DIR}/${CONFIGURATION}-iphoneos/lib${PROJECT_NAME}.a" "${BUILD_DIR}/${CONFIGURATION}-iphonesimulator/lib${PROJECT_NAME}.a"
//
//# Last touch. copy the header files. Just for convenience
//cp -R "${BUILD_DIR}/${CONFIGURATION}-iphoneos/include" "${UNIVERSAL_OUTPUTFOLDER}/"
//
