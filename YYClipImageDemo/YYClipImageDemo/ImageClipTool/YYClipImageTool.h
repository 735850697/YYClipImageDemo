//
//  YYClipImageTool.h
//  YYClipImageDemo
//
//  Created by Arvin on 15/12/22.
//  Copyright © 2015年 Arvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYClipImageTool : UIImageView
/**!
 *  @param view            要添加到的当前View
 *  @param image           要进行裁剪的图片
 *  @param backgroundImage 可以设置背景图片
 */
+ (void)addToCurrentView:(UIView *)view clipImage:(UIImage *)image backgroundImage:(NSString *)backgroundImage;

@end
