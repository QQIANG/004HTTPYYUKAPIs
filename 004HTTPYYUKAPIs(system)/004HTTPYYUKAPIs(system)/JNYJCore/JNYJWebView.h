//
//  JNYJWebView.h
//  QiQiao
//
//  Created by William on 13/3/15.
//  Copyright (c) 2015 zhggp. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 ----> 1 type Crashed [UIWebView _frameOrBoundsChanged] crashed  I HAVE NOT IDEAs
 JNYJWebView *webView_ = [[JNYJWebView alloc] initWithFrame:CGRectMake(....)];
 
 ----> 2 type DIDNOT CRASHED I HAVE ALSO NOT IDEAs
 JNYJWebView *webView_ = [[JNYJWebView alloc] init];
 
 [scrollView_ addSubview:webView_];
 [webView_ setFrame:CGRectMake(0,
 rect_.origin.y+rect_.size.height,
 rect_s.size.width,
 rect_s.size.height-(rect_.origin.y+rect_.size.height)+CGFloat_nav_height)];
 
 */
@interface JNYJWebView : UIWebView
@end
