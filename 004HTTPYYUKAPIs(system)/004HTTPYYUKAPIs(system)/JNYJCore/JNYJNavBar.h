//
//  JNYJNavBar.h
//  QiQiao
//
//  Created by William on 13/3/15.
//  Copyright (c) 2015 zhggp. All rights reserved.
//

#import <UIKit/UIKit.h>

#define JNYJNavBar_CGFloat_view_heigth 44.0f
#define JNYJNavBar_CGFloat_leftright_space 10.0f
#define JNYJNavBar_CGFloat_backLogo_width 30.0f

@protocol JNYJNavBarDelegate <NSObject>

-(void)callback_back:(id)sender;

@end

@interface JNYJNavBar : UIView
@property(nonatomic,strong)id<JNYJNavBarDelegate> delegate_callback;

-(void)setNavBackgroundColor:(UIColor *)color;

+(id)showNavBarInView:(UIView *)view title:(NSString *)title;

@end
