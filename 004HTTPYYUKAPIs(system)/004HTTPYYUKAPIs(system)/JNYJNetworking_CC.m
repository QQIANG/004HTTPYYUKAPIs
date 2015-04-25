//
//  JNYJNetworking_CC.m
//  GKIC
//
//  Created by JNYJ on 11-8-18.
//  Copyright 2011年 Comcsoft. All rights reserved.
//

#import "JNYJNetworking_CC.h"
#import <UIKit/UIKit.h>
@interface JNYJNetworking_CC ()
- (void)dealWithResponse:(NSString *)responseString;
@end

@implementation JNYJNetworking_CC

#pragma mark --
#pragma mark Do log
+(void)doLogForTemp:(NSString *)formatstring, ...{
	va_list arglist;
	if (!formatstring) return;
	va_start(arglist, formatstring);
	NSString *outstring = [[NSString alloc] initWithFormat:formatstring arguments:arglist];
	va_end(arglist);
    NSLog(@"===---->--->-->->: %@",outstring);
}
+(void)doLogFrameForTemp:(CGRect)frame{
    [self doLogForTemp:@"===---->--->-->->: X: %f; Y: %f; W: %f; H: %f;",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height];
}
#pragma mark - call
+ (JNYJNetworking_CC*)RequestService:(NSString *)serviceURLPath
                         andDelegate:(id)delegate
{
    //init InterfaceCaller
    JNYJNetworking_CC *mainInterfaceCaller = [[JNYJNetworking_CC alloc] init];
    [mainInterfaceCaller setDelegate:delegate];
    NSURL *serviceURL = [[NSURL alloc] initWithString:serviceURLPath];
    //
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:serviceURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    [theRequest addValue:@"text/json" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"POST"];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:mainInterfaceCaller];
    
    if(theConnection) {
        [JNYJNetworking_CC doLogForTemp: @"theConnection called"];
    }
    else {
        [JNYJNetworking_CC doLogForTemp: @"theConnection is NULL"];
        if (delegate) [delegate JNYJNetworking_CC:mainInterfaceCaller EndWithData:nil];
	}
    
    return mainInterfaceCaller;
}

+ (JNYJNetworking_CC*)RequestService:(NSString *)serviceURLPath
                         andDelegate:(id)delegate
                             andData:(NSString *)dataString
{   
    //init InterfaceCaller
    JNYJNetworking_CC *mainInterfaceCaller = [[JNYJNetworking_CC alloc] init];
    [mainInterfaceCaller setDelegate:delegate];
    NSURL *serviceURL = [[NSURL alloc] initWithString:serviceURLPath];
    //
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:serviceURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    [theRequest addValue:@"text/json" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody:[dataString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:mainInterfaceCaller];
    
    if(theConnection) {
        [JNYJNetworking_CC doLogForTemp: @"theConnection called"];
    }
    else {
        [JNYJNetworking_CC doLogForTemp: @"theConnection is NULL"];
        if (delegate) [delegate JNYJNetworking_CC:mainInterfaceCaller EndWithData:nil];
	}
    
    return mainInterfaceCaller;
}
+(JNYJNetworking_CC *)uploadToPath:(NSString *)serviceURLPath delegate:(id)delegate{
    //init InterfaceCaller
    JNYJNetworking_CC *mainInterfaceCaller = [[JNYJNetworking_CC alloc] init];
    [mainInterfaceCaller setDelegate:delegate];
    
    NSMutableURLRequest *request= [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:serviceURLPath]];
    [request setHTTPMethod:@"POST"];
    
    NSMutableData *postbody = [NSMutableData data];
    
    [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"user_id\"\r\n\r\n%@",
                           @"userid"]
                          dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",@"boundary"]
                          dataUsingEncoding:NSUTF8StringEncoding]];
    
//    [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"video\"; filename=\"%@\"\r\n", @"a.mov"]
//                          dataUsingEncoding:NSUTF8StringEncoding]];
//    [postbody appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"]
//                          dataUsingEncoding:NSUTF8StringEncoding]];
    
//    [postbody appendData:[NSData dataWithData:@"file"]];
//    [postbody appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",@"boundary"]
//                          dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:postbody];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request
                                                                     delegate:self];
    
    if(theConnection) {
        [JNYJNetworking_CC doLogForTemp: @"theConnection called"];
    }else {
        [JNYJNetworking_CC doLogForTemp: @"theConnection is NULL"];
        if (delegate) [delegate JNYJNetworking_CC:mainInterfaceCaller EndWithData:nil];
    }
    
    return mainInterfaceCaller;
}

- (void)dealloc
{
    
}

#pragma mark - connection delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.receivedData = [NSMutableData data];
}

- (void)connection:(NSURLConnection *)aConn didReceiveData:(NSData *)data {
    [self.receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)aConn didFailWithError:(NSError *)error {
    [JNYJNetworking_CC doLogForTemp: @"connection error: %@", [error localizedDescription]];
    self.receivedData = nil;
    if (self.delegate) [self.delegate JNYJNetworking_CC:self EndWithData:nil];
//    self = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)aConn {
    
    //response string
    NSString *results = [[NSString alloc] initWithBytes:[self.receivedData bytes] length:[self.receivedData length] encoding:NSUTF8StringEncoding];
    [JNYJNetworking_CC doLogForTemp: @"\nconnectionDidFinishLoading -- \nwholeResults:(\n%@\n)", results];
    self.receivedData = nil;
    [self dealWithResponse:results];
    results = nil;
//    [self release], self = nil;
}

-(void)connection:(NSURLConnection *)connection
  didSendBodyData:(NSInteger)bytesWritten
totalBytesWritten:(NSInteger)totalBytesWritten
totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite{
    //
    
    //
}


#pragma mark DealWith data
- (void)dealWithResponse:(NSString *)responseString
{
    NSDictionary *dictobj = [NSString dic_JSON:responseString];//[responseString dic_];
    [JNYJNetworking_CC doLogForTemp:@"Result:(\n%@)",dictobj];
    if (self.delegate) [self.delegate JNYJNetworking_CC:self EndWithData:dictobj];
}


#pragma mark Default Data string
+ (NSString *)dataString4AppStart{
    //
    NSString *local = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSString *dataString = [NSString stringWithFormat:@"{\"bundle\":\"%@\",\"version\":\"%@\",\"locale\":\"%@\"}",
                            [[NSBundle mainBundle] bundleIdentifier],
                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],
                            local];
    return  dataString;
}
@end
