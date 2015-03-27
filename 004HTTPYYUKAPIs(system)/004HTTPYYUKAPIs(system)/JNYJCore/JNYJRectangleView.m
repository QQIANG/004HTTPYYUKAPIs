//
//  JNYJRectangleView.m
//  RectangleDemo
//
//  Created by William on 13/3/15.
//  Copyright (c) 2015 William. All rights reserved.
//

#import "JNYJRectangleView.h"


@implementation JNYJRectangleView
-(instancetype)initWithFrame:(CGRect)frame{
    self  = [super initWithFrame:frame];
    if(self){
        [self setBackgroundColor:[UIColor clearColor]];
        //
        CGRect rect_ = frame;
        UIView *view_ = [[UIView alloc] initWithFrame:
                         CGRectMake(0, 0, rect_.size.width, rect_.size.height)];
        self.viewBG = view_;
        [self addSubview:view_];
        rect_ = view_.frame;
        view_ = [[UIView alloc] initWithFrame:
                         CGRectMake(0, 0,
                                    rect_.size.width, rect_.size.height)];
        self.viewContents = view_;
        [self.viewBG addSubview:view_];
    }
    return self;
}
+(void)showPlusMinusViewIn:(UIView *)view frame:(CGRect)frame{
    JNYJRectangleView *viewContents = [[JNYJRectangleView alloc] initWithFrame:frame];
    [view addSubview:viewContents];
    
    CGRect rect_ = viewContents.viewContents.frame;
    CGFloat float_left_width = rect_.size.height;
    //
    /*
     0^----^----------^--->|w
     0|    |          |    |
     0|<---|----------|----|
     */
    //
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0, 0.0)];
    [path addLineToPoint:CGPointMake(rect_.size.width, 0.0)];
    [path addLineToPoint:CGPointMake(rect_.size.width, rect_.size.height)];
    [path addLineToPoint:CGPointMake(0.0, rect_.size.height)];
    [path addLineToPoint:CGPointMake(0.0, 0.0)];
    [path moveToPoint:CGPointMake(float_left_width, float_left_width)];
    [path addLineToPoint:CGPointMake(float_left_width, 0.0)];
    [path moveToPoint:CGPointMake(rect_.size.width-float_left_width, float_left_width)];
    [path addLineToPoint:CGPointMake(rect_.size.width-float_left_width, 0)];
    
    // 4th Create a CAShapeLayer that uses that UIBezierPath:
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [JNYJRectangleView_Color_line CGColor];
    shapeLayer.lineWidth = JNYJRectangleView_float_line_size;
    shapeLayer.fillColor = [JNYJRectangleView_Color_contents CGColor];
    // 5th add shapeLayer as sublayer inside layer view
    [viewContents.viewContents.layer addSublayer:shapeLayer];
}
//-(void)drawRect:(CGRect)rect{
//
//    CGRect rectangle = CGRectMake(50, 50, 100, 100);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetRGBStrokeColor(context, 186/255.0, 186/255.0, 186/255.0, 0.5);   //this is the transparent color
////    CGContextSetRGBFillColor(context, 246/255.0, 246/255.0, 246/255.0, 0.5);
////    CGContextFillRect(context, rectangle);
//    CGContextStrokeRect(context, rectangle);
//}
@end
