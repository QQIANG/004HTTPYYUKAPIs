//
//  Created by William on 2/2/10.
//  Copyright (c) 2010 JNYJ. All rights reserved.
//
@interface JNYJCommon : NSObject

+(float)widthScreen;

+(UIFont *)fontNameSize:(CGFloat)size;

+(void)setUserDefaultValue:(NSString *)value Key:(NSString *)key;
+(NSString *)userDefaultValueWithKey:(NSString *)key;
+(void)setUserDefaultValue_double:(double)value Key:(NSString *)key;
+(double)userDefaultValue_double_WithKey:(NSString *)key;
+(BOOL) isFirstSetedKey:(NSString *)key;

@end

@interface UIView (CenterViewInScrollView)
-(void)centerViewInScrollView:(UIScrollView *)scrollView;
@end