//
//  SharePlatformPlugin.m
//  iOS_Project
//
//  Created by 张三弓 on 2019/9/25.
//  Copyright © 2019 张三弓. All rights reserved.
//

#import "SharePlatformPlugin.h"
#import "SharePlatformViewFactory.h"

@implementation SharePlatformPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"share_platform_plugin"
                                     binaryMessenger:[registrar messenger]];
    SharePlatformPlugin* instance = [[SharePlatformPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    // 添加注册我们创建的 view ，注意这里的 withId 需要和 flutter 侧的值相同
    [registrar registerViewFactory:[[SharePlatformViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"platform_text_view"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
