//
//  SharePlatformViewFactory.m
//  iOS_Project
//
//  Created by 张三弓 on 2019/9/25.
//  Copyright © 2019 张三弓. All rights reserved.
//

#import "SharePlatformViewFactory.h"
#import "IOSTextView.h"

@implementation SharePlatformViewFactory{
    NSObject<FlutterBinaryMessenger>*_messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager{
    self = [super init];
    if (self) {
        _messenger = messager;
    }
    return self;
}

-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

-(NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args{
    IOSTextView *iosTextView = [[IOSTextView alloc] initWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return iosTextView;
}

@end
