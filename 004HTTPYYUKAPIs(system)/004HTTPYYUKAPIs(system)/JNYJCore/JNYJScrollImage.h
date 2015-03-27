//
//  JNYJScrollImage.h
//  QiQiao
//
//  Created by William on 13/3/15.
//  Copyright (c) 2015 zhggp. All rights reserved.
//

#import <UIKit/UIKit.h>

#define k_JNYJScrollImage_data @"k_JNYJScrollImage_data"

@protocol JNYJScrollImageDelegate <NSObject>

-(void)callback_tap:(id)sender;

@end


@interface JNYJScrollImage : UIScrollView<UIScrollViewDelegate>
@property(nonatomic,strong)UIPageControl    *pageControl;
@property(nonatomic,strong)NSArray          *arrayContents;

@property(nonatomic,weak)id<JNYJScrollImageDelegate> delegate_callback;

+(id)showScrollImageIn:(UIView *)view url:(NSArray *)array;
-(void)hideScrollImage;
@end
