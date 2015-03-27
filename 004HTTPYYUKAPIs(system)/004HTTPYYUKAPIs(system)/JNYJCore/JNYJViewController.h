//
//  JNYJViewController.h
//  QiQiao
//
//  Created by William on 17/3/15.
//  Copyright (c) 2015 zhggp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JNYJViewControllerDelegate <NSObject>

-(void)callback_back:(id)sender;

@end

@interface JNYJViewController : UIViewController

@property(nonatomic, strong)NSMutableDictionary *dicValues;
@property(nonatomic, strong)UIView *viewBG;
@property(nonatomic,assign)BOOL isLoadDataSource;
@end
