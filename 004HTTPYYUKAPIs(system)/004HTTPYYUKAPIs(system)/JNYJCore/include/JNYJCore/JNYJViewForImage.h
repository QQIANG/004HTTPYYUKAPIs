//
//  Created by William on 2/2/10.
//  Copyright (c) 2010 JNYJ. All rights reserved.
//
#define Url_temp @"http://www.7qiao.com/media/download.do?id=e3d9a9d0b6134e859554fe1dbda39fa5"
#define JNYJ_Height4StatusBar  20
#define JNYJ_Background_color [UIColor blackColor]
@protocol  JNYJViewForImageDelegate <NSObject>

-(void)callback_tapView:(id)sender;
-(void)callback_didEndLoadingImage:(id)sender;

@end



@interface JNYJViewForImage : UIView<UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    CGFloat floatScale;
    CGFloat floatOriginWidth;
    CGFloat floatOriginHeight;
    
    CGFloat floatOriginWidth_Space;
    CGFloat floatOriginHeight_Space;
    
    UITapGestureRecognizer *_tapGestureRecognizer;
}

@property(nonatomic,strong)UIView *viewBG;

@property(nonatomic,strong)NSString *urlOfImage;

@property(nonatomic,strong)UIScrollView *scrollViewContents;
@property(nonatomic,strong)UIImageView  *imageViewContents;
//
@property(nonatomic,weak)id<JNYJViewForImageDelegate> delegate_callBack;

-(void)configureView;

-(void)showImage:(UIImage *)image;
-(void)showImageWithUrl:(NSString *)url;
@end
