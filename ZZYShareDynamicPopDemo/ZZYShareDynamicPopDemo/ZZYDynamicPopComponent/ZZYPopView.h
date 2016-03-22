//
//  ZZYPopView.h
//  ZZYShareDynamicPopDemo
//
//  Created by Code on 16/3/22.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZZYPopView;
@protocol ZZYPopViewDelegate <NSObject>
@optional
-(void)getClickButtonTag:(NSInteger)tag andTitle:(NSString *)title;
@end

@interface ZZYPopView : UIView<UIScrollViewDelegate>

@property (nonatomic,retain) NSMutableArray * shareBtnArray;
@property (nonatomic,retain) NSMutableArray * operationArray;
@property (nonatomic,assign) id<ZZYPopViewDelegate>delegate;

@property (nonatomic,retain) UIScrollView   * shareBGScrollView;//弹出框上部的分享按钮的背景图，是一个滑动视图
@property (nonatomic,retain) UIView         * operationBGView;//弹出框的操作背景视图
@property (nonatomic,retain) UIButton       * cancelButton;


-(void)showPopView;
-(void)hiddenPopView;
-(void)needCancelButton;
@end
