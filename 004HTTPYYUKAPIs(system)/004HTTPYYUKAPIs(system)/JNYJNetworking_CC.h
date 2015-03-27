//
//  JNYJNetworking_CC.h
//  GKIC
//
//  Created by JNYJ on 12-01-09.
//  Copyright 2012年 Comcsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JNYJCore.h"

#define URL_ComcsoftApps_iZip                   @"http://appservices.comcsoft.com/app_services/common/getListOfAvailableApps.php?codeOfApp=1201"

//Data menagement page --->
/*
 Need set the same data 4 those pages;
 http://app2.comcsoft.com/app_services/appname/app_start/set_app_start.php
 http://app1.comcsoft.com/app_services/appname/app_start/set_app_start.php
 
 */
#define URL_Comcsoft_AppStart_iZip                   @"http://appservices.comcsoft.com/app_services/izip/get_app_start.php"

@class JNYJNetworking_CC;

@protocol JNYJNetworking_CCDelegate <NSObject>
- (void)JNYJNetworking_CC:(JNYJNetworking_CC *)JNYJ EndWithData:(NSObject*)data;
@end

@interface JNYJNetworking_CC : NSObject <NSURLConnectionDataDelegate>
@property (nonatomic, weak) id<JNYJNetworking_CCDelegate>   delegate;
@property (nonatomic, strong) NSMutableData              *receivedData;


+ (JNYJNetworking_CC*)RequestService:(NSString *)serviceURLPath
                      andDelegate:(id)delegate;
+ (JNYJNetworking_CC*)RequestService:(NSString *)serviceURLPath
                      andDelegate:(id)delegate
                          andData:(NSString *)dataString;

#pragma mark Default Data string
+ (NSString *)dataString4AppStart;
@end
