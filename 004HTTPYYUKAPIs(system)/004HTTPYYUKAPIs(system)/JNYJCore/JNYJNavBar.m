//
//  JNYJNavBar.m
//  QiQiao
//
//  Created by William on 13/3/15.
//  Copyright (c) 2015 zhggp. All rights reserved.
//

#import "JNYJNavBar.h"
@implementation JNYJNavBar
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)setNavBackgroundColor:(UIColor *)color{
    [self setBackgroundColor:color];
}
#pragma mark Event
-(void)event_back:(id)sender{
    if([self.delegate_callback respondsToSelector:@selector(callback_back:)]){
        [self.delegate_callback callback_back:nil];
    }
}
#pragma mark Status
+(id)showNavBarInView:(UIView *)view title:(NSString *)title{
    CGRect rect_ = view.frame;
//    CGRect rect_s = view.frame;
    //
    JNYJNavBar *view_ = [[JNYJNavBar alloc] initWithFrame:
                         CGRectMake(0, 0, rect_.size.width, JNYJNavBar_CGFloat_view_heigth)];
    [view addSubview:view_];
    [view_ setBackgroundColor:[UIColor whiteColor]];
    //
    rect_ = view_.frame;
    UIImageView *imageView_ = [[UIImageView alloc] initWithFrame:
                               CGRectMake(JNYJNavBar_CGFloat_leftright_space,
                                          (rect_.size.height-JNYJNavBar_CGFloat_backLogo_width)/2.0,
                                          JNYJNavBar_CGFloat_backLogo_width, JNYJNavBar_CGFloat_backLogo_width)];
    [view_ addSubview:imageView_];
    [imageView_ setImage:[UIImage imageNamed:@"icon_back_JNYJNavBar"]];
    ///
    rect_ = view_.frame;
    UILabel *label_ = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, rect_.size.width, rect_.size.height)];
    [view_ addSubview:label_];
    [label_ setTextAlignment:NSTextAlignmentCenter];
    [label_ setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [label_ setTextColor:[UIColor blackColor]];
    [label_ setText:title];
    //
    rect_ = view_.frame;
    imageView_ = [[UIImageView alloc] initWithFrame:
                  CGRectMake(0,
                             rect_.size.height-0.5,
                             rect_.size.width,
                             0.5)];
    [view_ addSubview:imageView_];
    [imageView_ setBackgroundColor:[UIColor grayColor]];
    ///
    rect_ = view_.frame;
    UIButton *button_ = [UIButton buttonWithType:UIButtonTypeCustom];
    [button_ setFrame:CGRectMake(0, 0,
                                 rect_.size.height+(JNYJNavBar_CGFloat_leftright_space*2),
                                 rect_.size.height)];
    [view_ addSubview:button_];
    [button_ addTarget:view_ action:@selector(event_back:) forControlEvents:UIControlEventTouchUpInside];
    [button_ setBackgroundColor:[UIColor clearColor]];
    [button_ setShowsTouchWhenHighlighted:YES];
    //
    return view_;
}
@end
