//
//  JNYJTableView.m
//  QiQiao
//
//  Created by William on 17/3/15.
//  Copyright (c) 2015 zhggp. All rights reserved.
//

#import "JNYJTableView.h"

@interface JNYJTableView ()

@property(nonatomic, strong)NSMutableArray     *arrayContentsALL;

@end
@implementation JNYJTableView

-(void)setContents:(NSArray *)array{
    NSMutableArray *array_new = [NSMutableArray arrayWithArray:array];
    if (self.isLoadMore) {
        if (self.arrayContentsALL) {
        }else{
            self.arrayContentsALL = [NSMutableArray array];
        }
        for (int i =0; i<[array_new count]; i++) {
            [self.arrayContentsALL addObject:[array_new objectAtIndex:i]];
        }
        self.arrayContents = [NSArray arrayWithArray:self.arrayContentsALL];
    }else{
        self.arrayContentsALL = array_new;
        self.arrayContents = [NSArray arrayWithArray:self.arrayContentsALL];
    }
    if ([self.arrayContents count]>0) {
        self.isLoaded = YES;
    }else{
        self.isLoaded = NO;
    }
    self.isLoadMore = NO;
}
@end
