//
//  Created by William on 2/2/10.
//  Copyright (c) 2010 JNYJ. All rights reserved.
//
#define JNYJ_CGFloat_leftright_contents_space 10
#define JNYJ_Message_background_color [UIColor blackColor]
#define JNYJ_Message_title_color [UIColor whiteColor]
@interface JNYJMessageView : NSObject
+ (instancetype)sharedMessageView;
+(void)showMessage:(NSString *)message inView:(UIView *)view;
@end
