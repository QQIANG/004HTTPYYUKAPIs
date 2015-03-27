//
//  DMCity.h
//  Five2One
//
//  Created by William on 14-4-22.
//  Copyright (c) 2014年 KTS. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface DMCity : NSObject

@property (nonatomic, strong) NSString *cityID;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, assign) BOOL isHot;
@property (nonatomic, strong) NSString *cityKey;
/*
 Struct--->
 	--> NSArray
		   --> Dictionary
 					---> id
 					---> name
 */
@property (nonatomic, strong) NSArray	*arrayOfCountries;

@end
