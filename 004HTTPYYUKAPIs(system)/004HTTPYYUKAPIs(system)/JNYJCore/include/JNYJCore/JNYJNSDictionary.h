//
//  Created by William on 2/2/10.
//  Copyright (c) 2010 JNYJ. All rights reserved.
//
@interface NSDictionary (JNYJ_JSON)

+(NSString *)JSON_dic:(NSDictionary *)dic;
+(NSDictionary *)dic_JSON:(NSString *)json;

@end


@interface NSString (JNYJ_JSON)

+(NSString *)JSON_dic:(NSDictionary *)dic;
+(NSDictionary *)dic_JSON:(NSString *)json;

@end

