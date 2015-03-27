//
//  DemoBiz.m
//  004HTTPYYUKAPIs(system)
//
//  Created by William on 27/3/15.
//  Copyright (c) 2015 JNYJ. All rights reserved.
//

#import "DemoBiz.h"
@implementation DemoBiz

#pragma mark APIClient
+ (DemoBiz *)sharedDemoBiz{
    static DemoBiz *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[DemoBiz alloc] init];
    });
    
    return _sharedClient;
}
-(void)getData{
    [JNYJNetworking_CC RequestService:URL_ComcsoftApps_iZip andDelegate:self];
}
-(void)uploadFile{
    [JNYJNetworking_CC RequestService:nil andDelegate:self andData:nil];
}

#pragma mark delegate JNYJNetworking_CC
-(void)JNYJNetworking_CC:(JNYJNetworking_CC *)JNYJ EndWithData:(NSObject *)data{
    NSLog(@"JNYJNetworking_CC---->\n %@ \n<----\n",data);
}
@end
