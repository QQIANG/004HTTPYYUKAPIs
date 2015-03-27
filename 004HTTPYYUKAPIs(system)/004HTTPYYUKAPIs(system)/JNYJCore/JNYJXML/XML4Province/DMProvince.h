//
//  DMProvince.h
//  Five2One
//
//  Created by William on 14-4-22.
//  Copyright (c) 2014年 KTS. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DMProvince_NIL @"DMProvince_NIL"
#import "DMCity.h"
@interface DMProvince : NSObject

@property (nonatomic, strong) NSString *provinceID;
@property (nonatomic, strong) NSString *provinceName;
@property (nonatomic, assign) BOOL isHot;
@property (nonatomic, strong) NSString *cityKey;
@property (nonatomic, strong) NSArray *arrayOfCity;

@end
