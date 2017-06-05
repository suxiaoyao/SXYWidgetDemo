//
//  TodayViewController.m
//  SXYWidget
//
//  Created by Dandy on 2017/6/2.
//  Copyright © 2017年 doshr. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //配置Today Extension展示视图的大小
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
    
    //Today Extension的页面加一个可点击打开containingAPP的label
    UILabel *openAppLabel = [[UILabel alloc] init];
    openAppLabel.textColor = [UIColor colorWithRed:(97.0/255.0) green:(97.0/255.0) blue:(97.0/255.0) alpha:1];
    openAppLabel.backgroundColor = [UIColor clearColor];
    openAppLabel.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
    openAppLabel.textAlignment = NSTextAlignmentCenter;
    openAppLabel.text = @"点击打开app";
    openAppLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:openAppLabel];
    
    openAppLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *openURLContainingAPP = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openURLContainingAPP)];
    [openAppLabel addGestureRecognizer:openURLContainingAPP];
    
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    
    //配置边距为0
    return UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    
}

//通过openURL的方式启动Containing APP
- (void)openURLContainingAPP
{
    //scheme为app的scheme
    [self.extensionContext openURL:[NSURL URLWithString:@"SXYWidgetDemo://xxxx"]
                 completionHandler:^(BOOL success) {
                     NSLog(@"open url result:%d",success);
                 }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
