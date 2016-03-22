//
//  ZZYShareButton.m
//  ZZYShareDynamicPopDemo
//
//  Created by Code on 16/3/22.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZZYShareButton.h"
#import "ZZYConfig.h"
#define PercentHeight .6

@implementation ZZYShareButton
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor blackColor];
    }
    return self;
}


// 控制按钮上图片显示的位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = self.width*0.2;
    CGFloat imageW = self.width*PercentHeight;
    CGFloat imageY = 2;
    
    // 让图片的高度是整个按钮高度的60%
    CGFloat imageH = self.width * PercentHeight;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

// 控制按钮上标题显示的位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = self.height * PercentHeight;
    CGFloat titleW = self.width;
    CGFloat titleH = self.height - titleY;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
@end
