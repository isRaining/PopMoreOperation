//
//  ViewController.m
//  ZZYShareDynamicPopDemo
//
//  Created by Code on 16/3/22.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ViewController.h"
#import "ZZYConfig.h"
#import "ZZYPopView.h"

@interface ViewController ()<ZZYPopViewDelegate>
@property (nonatomic,retain) UIButton           * PopButton;
@property (nonatomic,retain) ZZYPopView         * popView;

@property (nonatomic,retain) NSMutableArray     * shareBtnArray;//存放分享按钮数据的数组
@property (nonatomic,retain) NSMutableArray     * operationArray;//存放下面操作按钮的数据的数组
@end

@implementation ViewController

#pragma mark Life Cycle 视图的声明周期区域
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.PopButton];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.view.backgroundColor = [UIColor colorWithRed:.3 green:.6 blue:1 alpha:1];
    self.PopButton.frame = CGRectMake((KDEVICEWIDTH-200)/2, 100, 200, 50);
}

#pragma mark Delegate 点击弹出框上按钮的代理方法
-(void)getClickButtonTag:(NSInteger)tag andTitle:(NSString *)title
{
    NSLog(@"你点击的button的tag是%i,%@",tag,title);
    [self.popView hiddenPopView];
}

#pragma mark PrivateMethod私有方法区域
-(void)buttonAction:(UIButton *)sender
{
    [self.popView showPopView];
}


#pragma mark Properties属性初始化区域
-(UIButton * )PopButton
{
    if (!_PopButton) {
        _PopButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_PopButton  setTitle:@"PopMoreOperation" forState:UIControlStateNormal];
        [_PopButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_PopButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_PopButton setBackgroundColor:[UIColor blackColor]];
        _PopButton.titleLabel.font = PopViewFont;
    }
    return _PopButton;
}
-(NSMutableArray * )shareBtnArray
{
    if (!_shareBtnArray) {
        NSMutableArray * shareBtnArray = [NSMutableArray array];
        //添加微信好友分享按钮
        NSMutableDictionary * dict1 = [NSMutableDictionary dictionary];
        [dict1 setObject:@"image0" forKey:@"image"];
        [dict1 setObject:@"微信好友" forKey:@"title"];
        [shareBtnArray addObject:dict1];
        //添加微信朋友圈分享按钮
        NSMutableDictionary * dict2 = [NSMutableDictionary dictionary];
        [dict2 setObject:@"image1" forKey:@"image"];
        [dict2 setObject:@"朋友圈" forKey:@"title"];
        [shareBtnArray addObject:dict2];
        //添加支付宝好友分享按钮
        NSMutableDictionary * dict3 = [NSMutableDictionary dictionary];
        [dict3 setObject:@"image2" forKey:@"image"];
        [dict3 setObject:@"支付宝好友" forKey:@"title"];
        [shareBtnArray addObject:dict3];
        //添加支付宝生活圈分享按钮
        NSMutableDictionary * dict4 = [NSMutableDictionary dictionary];
        [dict4 setObject:@"image3" forKey:@"image"];
        [dict4 setObject:@"生活圈" forKey:@"title"];
        [shareBtnArray addObject:dict4];
        //添加QQ好友分享按钮
        NSMutableDictionary * dict5 = [NSMutableDictionary dictionary];
        [dict5 setObject:@"image4" forKey:@"image"];
        [dict5 setObject:@"QQ好友" forKey:@"title"];
        [shareBtnArray addObject:dict5];
        //添加短信分享按钮
        NSMutableDictionary * dict6 = [NSMutableDictionary dictionary];
        [dict6 setObject:@"image5" forKey:@"image"];
        [dict6 setObject:@"短信" forKey:@"title"];
        [shareBtnArray addObject:dict6];
        //添加邮件分享按钮
        NSMutableDictionary * dict7 = [NSMutableDictionary dictionary];
        [dict7 setObject:@"image6" forKey:@"image"];
        [dict7 setObject:@"邮件" forKey:@"title"];
        [shareBtnArray addObject:dict7];
        _shareBtnArray = shareBtnArray;
    }
    return _shareBtnArray;
}
-(NSMutableArray *)operationArray
{
    if (!_operationArray) {
        NSMutableArray * operationArrzy = [NSMutableArray arrayWithObjects:@"举报",@"收藏",@"置顶",@"删除", nil];
        _operationArray = operationArrzy;
    }
    return _operationArray;
}
-(ZZYPopView *)popView
{
    if (!_popView) {
        _popView = [[ZZYPopView alloc]initWithFrame:CGRectZero];
        _popView.delegate = self;
        _popView.hidden = YES;
        _popView.shareBtnArray = self.shareBtnArray;
        _popView.operationArray = self.operationArray;
        //判断一下如果上面两个数组都不为空，说明弹出框有可选择的选项，如果都为空，说明没有选项可选
        if(_popView.shareBtnArray.count == 0 && _popView.operationArray.count == 0){
            return nil;
        }else{
            [_popView needCancelButton];
        }
        [self.view addSubview:self.popView];
    }
    return _popView;
}

@end
