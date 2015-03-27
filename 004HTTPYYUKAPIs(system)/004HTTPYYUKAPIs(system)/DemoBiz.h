//
//  DemoBiz.h
//  004HTTPYYUKAPIs(system)
//
//  Created by William on 27/3/15.
//  Copyright (c) 2015 JNYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JNYJCore.h"
#import "JNYJThirdCore.h"
#import "JNYJNetworking_CC.h"
@interface DemoBiz : NSObject<JNYJNetworking_CCDelegate>
+(DemoBiz *)sharedDemoBiz;
-(void)getData;
@end
