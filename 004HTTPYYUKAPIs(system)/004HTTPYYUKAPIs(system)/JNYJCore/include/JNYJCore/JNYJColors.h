//
//  Created by William on 2/2/10.
//  Copyright (c) 2010 JNYJ. All rights reserved.
//

#warning   ------------------>Knowing<-------------  call categary method crashed  --> unrecognized selector sent to instance 0x7574190  JNYJbuild setting  fine "Other Linker Flags"  add "-ObjC" building and runing it is OK.

@interface JNYJColors : NSObject

+(NSMutableAttributedString *)attributedString:(NSString *)value
									   keywords:(NSArray *)keywords
										  color:(id)color;

+(NSMutableAttributedString *)attributedString:(NSString *)value
									  keywords:(NSArray *)keywords
										 color:(id)color
										  font:(id)font;

+(NSMutableAttributedString *)attributedString:(NSString *)value
							   keywords_groups:(NSArray *)keywords
								  color_groups:(NSArray *)colors
										  font_groups:(NSArray *)fonts;
@end

@interface UIColor (extension)

+ (UIColor*) colorWithHexString:(NSString *)hexStr;
+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*) colorWithHex:(NSInteger)hexValue;
+ (NSString *) hexFromUIColor: (UIColor*) color;
+ (unsigned int)intFromHexString:(NSString *)hexStr;
@end
