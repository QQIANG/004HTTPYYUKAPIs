//
//  JNYJRectangleView.h
//  RectangleDemo
//
//  Created by William on 13/3/15.
//  Copyright (c) 2015 William. All rights reserved.
//
#import <UIKit/UIKit.h>
#define JNYJRectangleView_Color_line [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]
#define JNYJRectangleView_Color_contents [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]

#define JNYJRectangleView_float_line_size 0.5
@interface JNYJRectangleView : UIView
@property(nonatomic,strong)UIView *viewBG;
@property(nonatomic,strong)UIView *viewContents;

+(void)showPlusMinusViewIn:(UIView *)view frame:(CGRect)frame;
    
@end
