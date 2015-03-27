//
//  JNYJBiz.m
//  QiQiao
//
//  Created by William on 20/3/15.
//  Copyright (c) 2015 zhggp. All rights reserved.
//

#import "JNYJBiz.h"
#import "JNYJCore.h"
#import "JNYJThirdCore.h"

@implementation JNYJBiz

#pragma mark Progress
+(void)showProgressView:(UIView *)view{
    
    MBProgressHUD *hudNew = [MBProgressHUD showHUDAddedTo:view
                                                 animated:YES];
    hudNew.labelText = @"加载中...";
    hudNew.labelFont = [UIFont systemFontOfSize:12];
}
+(void)hideProgressView:(UIView *)view{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

#pragma mark Load image
+(void)didStartLoadingImage:(NSString *)url
                      block:(void (^)(NSArray *posts, NSError *error))block{
    //开启一个多线程GCD
    dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);//创建一个队列
    //开启一个线程
    dispatch_async(queue1, ^{
        
        UIImage *image_ = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            //
            if (image_) {
                if (block) {
                    block([NSArray arrayWithObject:image_], nil);
                }
            }else{
                if (block) {
                    block([NSArray array], nil);
                }
            }
            //
        });
    });
}
#pragma mark Path methods

+(NSString *)pathForDocmentFolder:(NSString *)fileName{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPath= [paths objectAtIndex:0];
    NSString *fileFullPath = [plistPath stringByAppendingPathComponent:fileName];
    return fileFullPath;
    
}

+(void)createFolderIfNotExisting:(NSString *)filePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //only create if the folder does not exists yet.
    if (![fileManager fileExistsAtPath:filePath])
    {
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}
//check whether file/folder already exists
+(BOOL) fileExists: (NSString *) filePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //only create if the folder does not exists yet.
    return	[fileManager fileExistsAtPath:filePath];
    
}
+(NSString *)pathForLocalFileName:(NSString *)fileName ofType:(NSString *)type{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    return filePath;
}

#pragma mark Network checking
+(id)sharedJNYJReachability{
    static JNYJReachability *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [JNYJReachability reachabilityWithHostName:URL_API_DOMAIN];
    });
    return _sharedClient;
}

+(void)startCheckingNetwork{
    //Start checking network
    [JNYJReachability startCheckWithReachability:[JNYJBiz sharedJNYJReachability]];
}
+(BOOL)isReachable{
    return [JNYJReachability isReachable];
}
+(BOOL)isWIFINetwork{
    if ([JNYJBiz isReachable]) {
        JNYJReachability *reach_ = (JNYJReachability *)[JNYJBiz sharedJNYJReachability];
        if(reach_.currentReachabilityStatus == JNYJJNYJReachableViaWiFi){
            return YES;
        }
    }
    return NO;
}
+(BOOL)checkNetwork{
    BOOL isReachable = [JNYJBiz isReachable];
    if (isReachable) {
    }else{
        [JNYJMessageView showMessage:Message_network_problem inView:[UIApplication sharedApplication].keyWindow];
    }
    return isReachable;
}
+(void)networkChecking:(id)sender
                 block:(void (^)(BOOL isReachable_, BOOL isWIFI, NSError *error_))block{
    //
    if ([JNYJReachability isReachable]) {
        JNYJReachability *reach_ = (JNYJReachability *)[JNYJBiz sharedJNYJReachability];
        if(reach_.currentReachabilityStatus == JNYJJNYJReachableViaWiFi){
            if (block) {
                block(YES, YES, nil);
            }
        }else{
            if (block) {
                block(YES, NO, nil);
            }
        }
        return;
    }
    //
    if (block) {
        block(NO, NO, [NSError errorWithDomain:URL_API_DOMAIN code:0 userInfo:nil]);
    }
    return;
}
@end
