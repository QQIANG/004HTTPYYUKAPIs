//
//  JNYJSort.m
//  QiQiao
//
//  Created by William on 12/3/15.
//  Copyright (c) 2015 zhggp. All rights reserved.
//

#import "JNYJSort.h"

@implementation JNYJSort

+(NSArray *)sortArray:(NSArray *)array asASEC:(BOOL)sortType{
    //
    NSArray *array_ = [NSArray arrayWithArray:array];
    NSSortDescriptor *sortD_ = [NSSortDescriptor sortDescriptorWithKey:@"" ascending:sortType];
    NSArray *array_new = [array_ sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortD_]];
    //
    return array_new;
}

@end
