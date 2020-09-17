//
//  EmbedViewController.m
//  WKWebViewObjC
//
//  Created by Abbie on 11/08/20.
//  Copyright © 2020 Abbie. All rights reserved.
//

#import "EmbedViewController.h"
#import <WebKit/WebKit.h>

@interface EmbedViewController ()<WKNavigationDelegate,WKUIDelegate, UIGestureRecognizerDelegate>{
    WKWebView *webView;
    NSTimer *idleTimer;
}
// @property(strong,nonatomic) WKWebView *webView;
@end

#define kMaxIdleTimeSeconds 10.0
@implementation EmbedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureHandlerMethod:)];
//    gestureRecognizer.delegate = self;
//    gestureRecognizer.numberOfTapsRequired = 1;
//    [self.view addGestureRecognizer:gestureRecognizer];
    
    
    WKPreferences *preferences = [[WKPreferences alloc] init];
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.preferences = preferences;
    webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 55, self.view.frame.size.width, self.view.frame.size.height)configuration:configuration];
    [webView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    NSString *htmlString = [NSString stringWithFormat:@"<html><head><meta name = \"viewport\" content = \"initial-scale = 1.0, user-scalable = yes, width = 320\"/></head><body style=\"background:#00;margin-top:0px;margin-left:5px\"><div><object width=\"320\" height=\"480\"><param name=\"movie\" value=\"https://www.youtube.com/embed/rCFstE7xE88\"></param><param name=\"wmode\" value=\"transparent\"></param><embed src=\"https://www.youtube.com/embed/rCFstE7xE88\"type=\"application/x-shockwave-flash\" wmode=\"transparent\" width=\"320\" height=\"480\"></embed></object></div></body></html>"];

    [webView loadHTMLString:htmlString baseURL:nil];
    [self.view addSubview:webView];
    [self resetIdleTimer];
}

- (void)resetIdleTimer {
    if (!idleTimer) {
        idleTimer = [NSTimer scheduledTimerWithTimeInterval:kMaxIdleTimeSeconds
                                                      target:self
                                                    selector:@selector(idleTimerExceeded)
                                                    userInfo:nil
                                                     repeats:NO];
    }
    else {
        if (fabs([idleTimer.fireDate timeIntervalSinceNow]) < kMaxIdleTimeSeconds-1.0) {
            [idleTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:kMaxIdleTimeSeconds]];
        }
    }
}

- (void)idleTimerExceeded {
    idleTimer = nil;
   // [self startScreenSaverOrSomethingInteresting];
    NSLog(@"Exceeded");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIResponder *)nextResponder {
    NSLog(@"Touched");
    [self resetIdleTimer];
    return [super nextResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
