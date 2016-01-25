//
//  YYClipImageTool.m
//  YYClipImageDemo
//
//  Created by Arvin on 15/12/22.
//  Copyright © 2015年 Arvin. All rights reserved.
//

#import "YYClipImageTool.h"

#define Width view.frame.size.width
#define Height view.frame.size.height
#define imageW image.size.width
#define imageH image.size.height * 0.5

@interface YYClipImageTool ()

@end

@implementation YYClipImageTool

+ (void)addToCurrentView:(UIView *)view clipImage:(UIImage *)image backgroundImage:(NSString *)backgroundImage {
    
    // 上半部
    UIImageView *topImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Width, Height * 0.5)];
    topImgView.image = [self clipImage:image withRect:CGRectMake(0, 0, imageW, imageH)];
    
    // 下半部
    UIImageView *bottomImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, Height * 0.5, Width, Height * 0.5)];
    bottomImgView.image = [self clipImage:image withRect:CGRectMake(0, imageH, imageW, imageH)];
    
    // 延时操作
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 执行动画
        [UIView animateWithDuration:2.0f animations:^{
            CGRect topRect = topImgView.frame;
            topRect.origin.y -= imageH;
            topImgView.frame = topRect;
            
            CGRect bottomRect = bottomImgView.frame;
            bottomRect.origin.y += imageH;
            bottomImgView.frame = bottomRect;
        }];
    });
    
    // 背景图
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:view.bounds];
    bgImage.image = [UIImage imageNamed:backgroundImage];
    
    // 添加到视图
    [view addSubview:bgImage];
    [view addSubview:topImgView];
    [view addSubview:bottomImgView];
}

// 返回裁剪后的图片
+ (UIImage *)clipImage:(UIImage *)image withRect:(CGRect)rect {
    CGRect clipFrame = rect;
    CGImageRef refImage = CGImageCreateWithImageInRect(image.CGImage, clipFrame);
    UIImage *newImage = [UIImage imageWithCGImage:refImage];
    CGImageRelease(refImage);
    return newImage;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
