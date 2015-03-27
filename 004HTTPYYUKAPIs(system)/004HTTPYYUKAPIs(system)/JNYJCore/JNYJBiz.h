//
//  JNYJBiz.h
//  QiQiao
//
//  Created by William on 20/3/15.
//  Copyright (c) 2015 zhggp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

#define URL_API_DOMAIN @"www.baidu.com"

@interface JNYJBiz : NSObject


+(void)showProgressView:(UIView *)view;
+(void)hideProgressView:(UIView *)view;
+(void)didStartLoadingImage:(NSString *)url
                      block:(void (^)(NSArray *posts, NSError *error))block;

+(BOOL)fileExists:(NSString *)filePath;
+(NSString *)pathForDocmentFolder:(NSString *)fileName;
+(NSString *)pathForLocalFileName:(NSString *)fileName ofType:(NSString *)type;


+(void)startCheckingNetwork;
+(BOOL)isReachable;
+(BOOL)isWIFINetwork;
+(BOOL)checkNetwork;
+(void)networkChecking:(id)sender
                 block:(void (^)(BOOL isReachable_, BOOL isWIFI, NSError *error_))block;


@end
