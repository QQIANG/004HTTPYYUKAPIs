//
//  Created by William on 2/2/10.
//  Copyright (c) 2010 JNYJ. All rights reserved.
//
@interface JNYJDashLine : UIView
@property (nonatomic, assign) CGFloat		float_dash_line_thickness;
@property (nonatomic, assign) CGFloat 		float_dash_width_line;
@property (nonatomic, assign) CGFloat 		float_dash_width_line_clear;
@property (nonatomic, strong) UIColor			*color_dash_line;

-(void)configureLine;
@end
