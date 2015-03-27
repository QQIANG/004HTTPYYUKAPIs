//
//  JNYJXML.m
//  CitysFromXMLDemo
//
//  Created by William on 16/3/15.
//  Copyright (c) 2015 William. All rights reserved.
//

#import "JNYJXML.h"

#import "GDataXMLNode.h"

@implementation JNYJXML

+(NSArray *)array_Province:(NSString *)filePath{
    
    //获取工程目录的xml文件
    //    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"xml"];
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //使用NSData对象初始化
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData  options:0 error:nil];
    
    //获取根节点（Users）
    GDataXMLElement *rootElement = [doc rootElement];
    
    //获取根节点下的节点（User）
    /*
     //province
     //city
     //district(country)
     //zipcode,name
     */
    //
    DMProvince *province_ = nil;
    DMCity *city_ = nil;
    DMCountry *country_ = nil;
    //
    NSArray *array_province_ = [rootElement elementsForName:@"province"];
    //
    NSMutableArray *array_province= [NSMutableArray array];
    BOOL isHaveInclude =  NO;
    for (GDataXMLElement *provinceItem in array_province_) {
        isHaveInclude =  NO;
        //
        province_ = [[DMProvince alloc] init];
        [array_province addObject:province_];
        //province values
        //------------------------------------------------------------------------------------------------>
        NSString *string_ = [[provinceItem attributeForName:@"zipcode"] stringValue];
        if (string_) {
            if ([string_ isEqualToString:@""]) {
                [province_ setProvinceID:DMProvince_NIL];
            }else{
                [province_  setProvinceID:string_];
            }
        }
        string_ = [[provinceItem attributeForName:@"name"] stringValue];
        if (string_) {
            if ([string_ isEqualToString:@""]) {
                [province_  setProvinceName:DMProvince_NIL];
            }else{
                [province_  setProvinceName:string_];
            }
        }
        //City values
        //------------------------------------------------------------------------------------------------>
        NSArray *array_city_ = [provinceItem elementsForName:@"city"];
        NSMutableArray *array_city = [NSMutableArray array];
        for (GDataXMLElement *cityItem in array_city_) {
            city_ = [[DMCity alloc] init];
            [array_city addObject:city_];
            //id
            string_ = [[cityItem attributeForName:@"zipcode"] stringValue];
            if (string_) {
                [city_  setCityID:string_];
            }
            //name
            string_ = [[cityItem attributeForName:@"name"] stringValue];
            if (string_) {
                [city_  setCityName:string_];
            }
            //Country
            //------------------------------------------------------------------------------------------------>
            NSArray *array_country_ = [cityItem elementsForName:@"district"];
            NSMutableArray 	*array_country = [NSMutableArray array];
            for (GDataXMLElement *countryItem in array_country_) {
                //
                country_ = [[DMCountry alloc] init];
                [array_country addObject:country_];
                //id
                string_ = [[countryItem attributeForName:@"zipcode"] stringValue];
                if (string_) {
                    [country_  setCountryID:string_];
                }
                //name
                string_ = [[countryItem attributeForName:@"name"] stringValue];
                if (string_) {
                    [country_  setCountryName:string_];
                }
            }
            [city_ setArrayOfCountries:array_country];
        }
        [province_ setArrayOfCity:array_city];
    }
    return array_province;
}

@end
