//
//  GenericClass.m
//  Test
//
//

#import "GenericClass.h"
#import "KonyWebViewController.h"
//#import "AppDelegate.h"
//#import "KonyUIContext.h"

@implementation GenericClass

+ (void)launchNativeControllerOnKonyForm:(NSString*)webURL titleName:(NSString*)name{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    KonyWebViewController *webview = [mainStoryboard instantiateViewControllerWithIdentifier:@"konyweb"];
    webview.productURL = webURL;
    webview.titleName = name;
    UIWindow *window =  [[[UIApplication sharedApplication] windows] firstObject];
    UIViewController *vc = [window rootViewController];
//    UINavigationController *navController = (UINavigationController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
//    [navController pushViewController:webview animated:YES];
    [vc presentViewController:webview animated:YES completion:nil];
}
@end
