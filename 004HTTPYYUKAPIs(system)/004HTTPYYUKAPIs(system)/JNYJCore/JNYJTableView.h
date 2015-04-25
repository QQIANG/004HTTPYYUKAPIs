//
//  JNYJTableView.h
//  QiQiao
//
//  Created by William on 17/3/15.
//  Copyright (c) 2015 zhggp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
@interface JNYJTableView : UITableView

@property(nonatomic,assign)BOOL isLoaded;
@property(nonatomic,assign)BOOL isLoadMore;
//
@property(nonatomic, strong)NSArray     *arrayContents;

-(void)setContents:(NSArray *)array;
@end
