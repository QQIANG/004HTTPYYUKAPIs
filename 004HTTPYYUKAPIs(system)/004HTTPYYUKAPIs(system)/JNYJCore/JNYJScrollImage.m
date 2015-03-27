//
//  JNYJScrollImage.m
//  QiQiao
//
//  Created by William on 12/3/15.
//  Copyright (c) 2015 zhggp. All rights reserved.
//

#import "JNYJScrollImage.h"

#define kImage_url                      @"kImage_url"
#define kImage_imageView                @"kImage_imageView"
#define kImage_imageLoaded              @"kImage_imageLoaded"
#define kImage_imageLoaded_value_YES    @"kImage_imageLoaded_value_YES"

@implementation JNYJScrollImage

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setShowsVerticalScrollIndicator:YES];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setPagingEnabled:YES];
        [self setDelegate:self];
    }
    return self;
}
-(void)configurePageControl{
    
    //
    CGRect rect_ = self.frame;
    UIPageControl *pageControl_ = [[UIPageControl alloc] initWithFrame:
                                   CGRectMake(0, rect_.size.height-20, rect_.size.width, 20)];
    self.pageControl = pageControl_;
    [pageControl_ setBackgroundColor:[UIColor clearColor]];
    [self addSubview:pageControl_];
    [pageControl_ setTintColor:[UIColor blueColor]];
    [pageControl_ setCurrentPage:1];
    [pageControl_ setNumberOfPages:[self.arrayContents count]];
    //
    [self setPageControl:pageControl_];
}
-(void)configureContents:(NSArray *)array{
    //
    NSMutableArray *array_new = [NSMutableArray array];
    NSMutableDictionary *dic_ = nil;
    UIImageView *imageView_ = nil;
    CGRect rect_ = self.frame;
    //
    for (int i=0; i<[array count]; i++) {
        //
        imageView_ = [[UIImageView alloc] initWithFrame:
                      CGRectMake((rect_.size.width*i),
                                 0,
                                 rect_.size.width,
                                 rect_.size.height)];
        [self addSubview:imageView_];
        //
        NSString *string_ = [NSString stringWithFormat:@"%@",[array objectAtIndex:i]];
        dic_ = [NSMutableDictionary dictionary];
        [dic_ setValue:@"NONONO" forKey:kImage_imageLoaded];
        [dic_ setValue:imageView_ forKey:kImage_imageView];
        if (string_ && [string_ isKindOfClass:[NSString class]] && ![string_ isEqualToString:@""]) {
            [dic_ setValue:string_ forKey:kImage_url];
            [array_new addObject:dic_];
            [self didStartLoadingImage:[dic_ valueForKey:kImage_url]
                                    block:^(NSArray *posts, NSError *error) {
                                        if (posts && [posts count]>0) {
                                            [dic_ setValue:[posts objectAtIndex:0] forKey:k_JNYJScrollImage_data];
                                            [imageView_ setImage:[posts objectAtIndex:0]];
                                        }
                                    }];
        }
    }
    self.arrayContents = array_new;
    //
    [self setContentSize:CGSizeMake(rect_.size.width*[self.arrayContents count],rect_.size.height)];
    //
    [self configurePageControl];
}
#pragma mark Private

-(void)didStartLoadingImage:(NSString *)url
                      block:(void (^)(NSArray *posts, NSError *error))block{
    //开启一个多线程GCD
    dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);//创建一个队列
    //开启一个线程
    dispatch_async(queue1, ^{
        
        UIImage *image_ = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            //
            if (image_) {
                if (block) {
                    block([NSArray arrayWithObject:image_], nil);
                }
            }else{
                if (block) {
                    block([NSArray array], nil);
                }
            }
            //
        });
    });
}
-(void)hideScrollImage{
    [self removeFromSuperview];
}
#pragma mark Delegate ScrollView
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGRect rect_ = self.pageControl.frame;
    CGPoint point_ = scrollView.contentOffset;
    rect_.origin.x = point_.x;
    [self.pageControl setFrame:rect_];
    //
    NSInteger current = scrollView.contentOffset.x/scrollView.frame.size.width;
    [self.pageControl setCurrentPage:current];
}
#pragma mark Status

+(id)showScrollImageIn:(UIView *)view url:(NSArray *)array{
    if (view && [view isKindOfClass:[UIView class]]) {
        CGRect rect_ = view.frame;
        JNYJScrollImage *scrollImage_ =[[JNYJScrollImage alloc] initWithFrame:
                                        CGRectMake(0, 0, rect_.size.width, rect_.size.height)];
        [view addSubview:scrollImage_];
        //
        [scrollImage_ configureContents:array];
        
        return scrollImage_;
        
    }
    return nil;
}
@end
