//
//  SharePlatformViewFactory.h
//  iOS_Project
//
//  Created by 张三弓 on 2019/9/25.
//  Copyright © 2019 张三弓. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface SharePlatformViewFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messager;

-(NSObject<FlutterMessageCodec> *)createArgsCodec;

-(NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args;

@end

NS_ASSUME_NONNULL_END
