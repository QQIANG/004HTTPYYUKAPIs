//
//  DMCity.m
//  Five2One
//
//  Created by William on 14-4-22.
//  Copyright (c) 2014年 KTS. All rights reserved.
//

#import "DMCity.h"

@implementation DMCity
-(NSString *)description{
	return [NSString stringWithFormat:@"----------------CITY------------->\nID:%@\nName:%@\nHot:%@\nKey:%@",
			self.cityID,self.cityName,(self.isHot?@"YES":@"NO"),self.cityKey];
}

@end
