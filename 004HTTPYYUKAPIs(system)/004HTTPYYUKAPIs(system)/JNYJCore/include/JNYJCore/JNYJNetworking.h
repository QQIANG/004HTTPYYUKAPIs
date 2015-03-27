//
//  Created by William on 2/2/10.
//  Copyright (c) 2010 JNYJ. All rights reserved.
//

@class JNYJNetworking;

@protocol JNYJNetworkingDelegate <NSObject>
- (void)InterfaceCaller:(JNYJNetworking *)caller EndWithData:(NSObject*)data;
@end

@interface JNYJNetworking : NSObject <NSURLConnectionDataDelegate>{
    id<JNYJNetworkingDelegate> delegate_networking;
    NSMutableData               *receivedData;
}
@property (nonatomic, assign) id<JNYJNetworkingDelegate>   delegate_networking;
@property (nonatomic, retain) NSMutableData                 *receivedData;

+ (JNYJNetworking *)RequestService:(NSString *)serviceURLPath andDelegate:(id)delegate;
@end
