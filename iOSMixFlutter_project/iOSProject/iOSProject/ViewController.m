//
//  ViewController.m
//  iOSProject
//
//  Created by 张三弓 on 2019/9/24.
//  Copyright © 2019 张三弓. All rights reserved.
//

#import <Flutter/Flutter.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import "SettingViewController.h"

@interface ViewController ()
{
    FlutterViewController * _flutterVC;
    FlutterMethodChannel * _messageChannel;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(pushAction)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"pushAction" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    button.frame = CGRectMake(80.0, 150.0, 160.0, 40.0);
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self
               action:@selector(presentAction)
     forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"presentAction" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor redColor]];
    button2.frame = CGRectMake(80.0, 150.0 + 80.0*2, 160.0, 40.0);
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 addTarget:self
                action:@selector(sendNoticeToFlutter)
      forControlEvents:UIControlEventTouchUpInside];
    [button3 setTitle:@"sendNoticeToFlutter" forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor redColor]];
    button3.frame = CGRectMake(80.0, 150.0 + 80.0*4, 160.0, 40.0);
    [self.view addSubview:button3];
}

- (void)sendNoticeToFlutter{
    [_messageChannel invokeMethod:@"passArgusToFlutter" arguments:@[@12,@"huahua"] result:^(id  _Nullable result) {
        NSString *ggg = (NSString *)result;
        NSLog(@"result----:%@",ggg);
    }];
}

- (void)presentAction{
    //建立交互通道
    _flutterVC = [[FlutterViewController alloc]initWithProject:nil nibName:nil bundle:nil];
    _flutterVC.title = @"我是Flutter页面";
    _messageChannel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter.dev/messageChannel" binaryMessenger:_flutterVC.binaryMessenger];
    __weak typeof(self) weakSelf = self;
    [_messageChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        if ([@"goSettingViewController" isEqualToString:call.method])
        {
            [weakSelf goSettingViewController];
            result(@1);
        } else if ([@"backToNavigatorIndex" isEqualToString:call.method]) {
            
        } else if ([@"dismiss" isEqualToString:call.method]) {
            [_flutterVC dismissViewControllerAnimated:YES completion:nil];
        }else {
            result(FlutterMethodNotImplemented);
        }
    }];
    
    [_flutterVC setInitialRoute:@"presentApp"];
    [self.navigationController presentViewController:_flutterVC animated:YES completion:nil];
}

- (void)pushAction {
    //建立交互通道
    _flutterVC = [[FlutterViewController alloc]initWithProject:nil nibName:nil bundle:nil];
    _flutterVC.title = @"我是Flutter页面";
    _messageChannel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter.dev/messageChannel" binaryMessenger:_flutterVC.binaryMessenger];
    __weak typeof(self) weakSelf = self;
    [_messageChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        if ([@"goSettingViewController" isEqualToString:call.method])
        {
            [weakSelf goSettingViewController];
            result(@1);
        } else if ([@"backToNavigatorIndex" isEqualToString:call.method]) {
            
        } else if ([@"pop" isEqualToString:call.method]) {
            [_flutterVC.navigationController popViewControllerAnimated:YES];
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
    
    [_flutterVC setInitialRoute:@"myApp"];
    [self.navigationController pushViewController:_flutterVC animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self sendNoticeToFlutter];
    });
}

- (void)goSettingViewController {
    SettingViewController *settingVC = [[SettingViewController alloc]init];
    [_flutterVC.navigationController pushViewController:settingVC animated:YES];
}

@end
