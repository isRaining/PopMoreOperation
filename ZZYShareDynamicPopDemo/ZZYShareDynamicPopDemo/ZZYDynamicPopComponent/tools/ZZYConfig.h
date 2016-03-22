//
//  ZZYConfig.h
//  ZZYShareDynamicPopDemo
//
//  Created by Code on 16/3/22.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#ifndef ZZYConfig_h
#define ZZYConfig_h


#import "UIView+ZZYViewFrame.h"




/**
 *  获取屏幕宽
 *
 *  @return DeviceWidth
 */
#define KDEVICEWIDTH [UIScreen mainScreen].bounds.size.width
/**
 *  获取屏幕高
 *
 *  @return DeviceHeight
 */
#define KDEVICEHEIGHT [UIScreen mainScreen].bounds.size.height
/**
 *  弹出视图使用的字体
 *
 *  @return UIFont
 */
#define PopViewFont [UIFont fontWithName:@"HelveticaNeue-Light" size:15]
/**
 *  分享按钮之间的间隔
 *
 *  @return 15
 */
#define ZZYPaddingOfShareButton 10

#endif /* ZZYConfig_h */

