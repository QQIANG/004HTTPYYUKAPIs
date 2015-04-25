//
//  DemoBiz.m
//  004HTTPYYUKAPIs(system)
//
//  Created by William on 27/3/15.
//  Copyright (c) 2015 JNYJ. All rights reserved.
//

#import "DemoBiz.h"
@implementation DemoBiz

#pragma mark API URL Format
+(NSString *)timestampCurrent{
    
    static NSDateFormatter *df = nil;
    static NSDateFormatter *df2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        df = [[NSDateFormatter alloc]init];//格式化
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        df2 = [[NSDateFormatter alloc]init];//格式化
        [df2 setDateFormat:@"yyyyMMddHHmmss"];
        [df2 setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    });
    //
    NSDate *date = [NSDate date];
    //
    NSString* s1 = [df stringFromDate:date];
    NSDate *date1 = [df dateFromString:s1];
    //
    NSString *string_time = [df2 stringFromDate:date1];
    
    return string_time;
    
}
+(NSMutableDictionary *)getAllCommonParams{
    NSMutableDictionary *dic_ = [NSMutableDictionary dictionary];
    [dic_ setValue:@"json" forKey:kAPI_URL_format];
    [dic_ setValue:@"all" forKey:kAPI_URL_fileType];
    [dic_ setValue:kClientid forKey:kAPI_URL_clientid];
    [dic_ setValue:kVer forKey:kAPI_URL_ver];
    //
    return dic_;
}
+(NSString *)code4APIParams:(NSDictionary *)dic{
    if (dic && [dic isKindOfClass:[NSDictionary class]]) {
    }else{return @"";}
    //
    NSString *string_code = @"";
    //
    NSArray *array_sorted = [JNYJSort sortArray:[dic allKeys] asASEC:YES];
    for (int i=0; i<[array_sorted count]; i++) {
        //
        string_code = [NSString stringWithFormat:@"%@%@%@",
                       string_code,
                       [array_sorted objectAtIndex:i],
                       [dic valueForKey:[array_sorted objectAtIndex:i]]];
        //
    }
    //
    return [string_code stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
+(NSString *)url4APIParams:(NSDictionary *)dic{
    if (dic && [dic isKindOfClass:[NSDictionary class]]) {
    }else{return @"";}
    //
    NSString *string_code = @"";
    //
    NSArray *array_sorted = [JNYJSort sortArray:[dic allKeys] asASEC:YES];
    for (int i=0; i<[array_sorted count]; i++) {
        //
        if (i == 0) {
            string_code = [NSString stringWithFormat:@"%@?",
                           [dic valueForKey:[array_sorted objectAtIndex:i]]];
        }else{
            string_code = [NSString stringWithFormat:@"%@%@=%@&",
                           string_code,
                           [array_sorted objectAtIndex:i],
                           [dic valueForKey:[array_sorted objectAtIndex:i]]];
        }
        //
    }
    //
    return [string_code stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+(NSString *)configureAPIURL:(NSDictionary *)dicValues{
    NSMutableDictionary *dic_ = [APIClient getAllCommonParams];
    for (NSString *item in [dicValues allKeys]) {
        [dic_ setValue:[dicValues valueForKey:item] forKey:item];
    }
    //
    NSString *string_ = [APIClient code4APIParams:dic_];
    //URL for API
    NSString *kNetData = [NSString stringWithFormat:@"%@",string_];
    
    Sign *sign = [[Sign alloc]init];
    NSString *string_code = [sign md5:[NSString stringWithFormat:@"%@%@%@",kSecurity,kNetData,kSecurity]];
    //Set all url pramas
    [dic_ setValue:[NSString stringWithFormat:@"%@",API_URL_Base] forKey:kAPI_URL_Base];
    [dic_ setValue:string_code forKey:kAPI_URL_sign];
    //
    string_ = [APIClient url4APIParams:dic_];
    //
    return string_;
}
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
