//
//  JNYJMDRadialProgressLabel.h
//  JNYJMDRadialProgress
//
//  Created by Marco Dinacci on 07/10/2013.
//  Copyright (c) 2013 Marco Dinacci. All rights reserved.
//

#import <UIKit/UIKit.h>

// iOS6 has deprecated UITextAlignment* in favour of NSTextAlignment*
// This allow me to use the property from iOS < 6.
#ifdef __IPHONE_6_0
#   define NSTextAlignmentCenter_    NSTextAlignmentCenter
#else
#   define NSTextAlignmentCenter_    UITextAlignmentCenter
#endif


@class JNYJMDRadialProgressTheme;

@interface JNYJMDRadialProgressLabel : UILabel

- (id)initWithFrame:(CGRect)frame andTheme:(JNYJMDRadialProgressTheme *)theme;

// If adjustFontSizeToFitBounds is enabled, limit the size of the font to the bounds'width * pointSizeToWidthFactor.
@property (assign, nonatomic) CGFloat pointSizeToWidthFactor;

// Whether the algorithm to autoscale the font size is enabled or not.
@property (assign, nonatomic) BOOL adjustFontSizeToFitBounds;

@property (strong, nonatomic) JNYJMDRadialProgressLabel	 *label_title;
@property (strong, nonatomic) JNYJMDRadialProgressLabel	 *label_title_detail;

@end
