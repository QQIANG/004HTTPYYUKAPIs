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


#define API_URL_Base kQiQiaoUrlString

#define kAPI_URL_Base @"aaaaaaaaUsingFirstKey"



#define kAPI_URL_method @"method"
#define kAPI_URL_userID @"userid"
#define kAPI_URL_clientid @"clientid"
#define kAPI_URL_timestamp @"timestamp"
#define kAPI_URL_ver @"ver"
#define kAPI_URL_fileType @"fileType"
#define kAPI_URL_format @"format"
#define kAPI_URL_sign @"sign"
#define kAPI_URL_lessionID @"lessonId"
#define kAPI_URL_memberId @"memberId"
#define kAPI_URL_pageNum @"pageNum"
#define kAPI_URL_pageNo @"pageNo"

#define kAPI_URL_pageIndex_start 1
#define kAPI_URL_pageSize @"pageSize"
#define kAPI_URL_pageSize_perCount 10

//网络请求参数类
//#define kQiQiaoUrlString  @"http://192.168.4.4:8090/mobile/api.do" //测试环境
#define kQiQiaoUrlString  @"http://www.7qiao.com/mobile/api.do"  //正式坏境
//#define kQiQiaoUrlString @"http://upload.1diandi.com/upload.do"
//#define kQiQiaoUrlString @"http://192.168.4.132/diandi-web/mobile/api.do"
//固定请求的参数
#define kClientid @"100"
#define kFormat  @"json"
#define kVer @"1.0"
#define kSecurity @"11111111"

@interface DemoBiz : NSObject<JNYJNetworking_CCDelegate>
+(DemoBiz *)sharedDemoBiz;
-(void)getData;
@end
