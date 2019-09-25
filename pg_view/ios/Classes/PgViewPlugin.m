#import "PgViewPlugin.h"
#import "PgViewFactory.h"

@implementation PgViewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [registrar registerViewFactory:[[PgViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"plugins/pg_view"];
    
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"pg_view"
                                     binaryMessenger:[registrar messenger]];
    PgViewPlugin* instance = [[PgViewPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
