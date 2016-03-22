//
//  ZZYPopView.m
//  ZZYShareDynamicPopDemo
//
//  Created by Code on 16/3/22.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZZYPopView.h"
#import "ZZYShareButton.h"
#import "ZZYConfig.h"

@implementation ZZYPopView
{
    CGFloat operationHeight;//弹出视图的高度
    CGFloat scrollViewHeight;//横向滑动视图的高度
}

#pragma mark init
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIWindow * windowCurrent = [[UIApplication sharedApplication].delegate window];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
        self.frame = windowCurrent.frame;

        UITapGestureRecognizer * tapAction = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tapAction];
        
        operationHeight = 0;
        scrollViewHeight = 0;
    }
    return self;
}


#pragma mark PrivateMethod(私有方法)
-(void)showPopView
{
    self.hidden = NO;
    [UIView animateWithDuration:.3 animations:^{
        self.operationBGView.frame = CGRectMake(0, KDEVICEHEIGHT-operationHeight, KDEVICEWIDTH, operationHeight);
    }];
}
-(void)hiddenPopView
{
    [UIView animateWithDuration:.3 animations:^{
        self.operationBGView.frame = CGRectMake(0, KDEVICEHEIGHT, KDEVICEWIDTH, operationHeight);
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}
-(void)needCancelButton
{
    [self.operationBGView addSubview:self.cancelButton];
}
-(void)tapAction
{
    [self hiddenPopView];
}
-(void)clickButtonAction:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(getClickButtonTag:andTitle:)]) {
        [self.delegate getClickButtonTag:sender.tag andTitle:sender.titleLabel.text];
    }
}


#pragma mark Properties(属性初始化)
-(void)setShareBtnArray:(NSMutableArray *)shareBtnArray
{
    _shareBtnArray = shareBtnArray;
    if (_shareBtnArray.count>0) {
        scrollViewHeight = 70;
        operationHeight += 71;
        
        if (_shareBtnArray.count * 70>KDEVICEWIDTH) {
            self.shareBGScrollView.contentSize = CGSizeMake(_shareBtnArray.count * 60+ZZYPaddingOfShareButton, scrollViewHeight);
        }else{
            _shareBGScrollView.contentSize = CGSizeMake(KDEVICEWIDTH, scrollViewHeight);
        }
        
        for (NSInteger i = 0; i < _shareBtnArray.count; i++) {
            ZZYShareButton * button = [ZZYShareButton buttonWithType:UIButtonTypeCustom];
            [button setImage:[UIImage imageNamed:[_shareBtnArray[i] objectForKey:@"image"]] forState:UIControlStateNormal];
            [button setTitle:[_shareBtnArray[i] objectForKey:@"title"] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10];
            button.frame = CGRectMake(ZZYPaddingOfShareButton+60*i, 10, 50, 50);
            button.tag = 10+i;
            button.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.0];
            [button addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.shareBGScrollView addSubview:button];
        }
    }
}
-(void)setOperationArray:(NSMutableArray *)operationArray
{
    _operationArray = operationArray;
    if(_operationArray.count > 0){
        for (NSInteger i = 0; i < _operationArray.count; i ++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitle:_operationArray[i] forState:UIControlStateNormal];
            button.frame = CGRectMake(0, scrollViewHeight+40*i, KDEVICEWIDTH, 40);
            button.titleLabel.font = PopViewFont;
            button.tag = 20+i;
            button.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.2];
            [button addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            operationHeight += 40;
            [self.operationBGView addSubview:button];
            
            UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, button.bottom, KDEVICEWIDTH, .5)] ;
            line.backgroundColor = [UIColor lightGrayColor];
            [self.operationBGView addSubview:line];
        }
    }
}
-(UIView *)operationBGView
{
    if (!_operationBGView) {
        _operationBGView = [[UIView alloc]initWithFrame:CGRectMake(0, KDEVICEHEIGHT, KDEVICEWIDTH, operationHeight)];
        _operationBGView.backgroundColor = [UIColor colorWithRed:.99 green:.99 blue:.99 alpha:.8];
        [self addSubview:_operationBGView];
    }
    return _operationBGView;
}
-(UIView *)shareBGScrollView
{
    if (!_shareBGScrollView) {
        _shareBGScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KDEVICEWIDTH, scrollViewHeight)];
        _shareBGScrollView.scrollEnabled = YES;
        _shareBGScrollView.delegate = self;
        _shareBGScrollView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.2];
        _shareBGScrollView.contentSize = CGSizeMake(KDEVICEWIDTH, scrollViewHeight);
        [self.operationBGView addSubview:_shareBGScrollView];
        
        UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, KDEVICEWIDTH, .5)] ;
        line.backgroundColor = [UIColor lightGrayColor];
        
        [self.operationBGView addSubview:line];
    }
    return _shareBGScrollView;
}
-(UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        _cancelButton.frame = CGRectMake(0, operationHeight, KDEVICEWIDTH, 40);
        _cancelButton.titleLabel.font = PopViewFont;
        _cancelButton.tag = 30;
        [_cancelButton setBackgroundColor:[UIColor whiteColor]];
        [_cancelButton addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
        operationHeight += 40;
    }
    return _cancelButton;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"滚动");
}
@end
