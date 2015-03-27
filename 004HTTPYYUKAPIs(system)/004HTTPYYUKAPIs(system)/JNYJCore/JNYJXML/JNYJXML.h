//
//  JNYJXML.h
//  CitysFromXMLDemo
//
//  Created by William on 16/3/15.
//  Copyright (c) 2015 William. All rights reserved.
//

#import <Foundation/Foundation.h>
// libxml includes require that the target Header Search Paths contain
//
//   /usr/include/libxml2
//
// and Other Linker Flags contain
//
//   -lxml2
/*
 not find in x86_64 "_kGDataXMLXPathDefaultNamespacePrefix"
 
 SOLUTION: Remove #import "GDataXMLNode.h" from precompiled header (and from .h files included there) and add it only in implementation files where needed.
 */
#import "DMProvince.h"
#import "DMCity.h"
#import "DMCountry.h"

#define KEY_city_groupTitle_hot_cities @"KEY_city_groupTitle_hot_cities"
#define KEY_city_groupTitle_current_city @"KEY_city_groupTitle_current_city"
#define VALUE_locate_ing @"VALUE_locate_ing"
@interface JNYJXML : NSObject

+(NSArray *)array_Province:(NSString *)filePath;

@end
