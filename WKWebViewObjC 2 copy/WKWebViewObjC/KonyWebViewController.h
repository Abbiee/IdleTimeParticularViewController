//
//  KonyWebViewController.h
//  WKWebViewObjC
//
//  Created by Abbie on 07/07/20.
//  Copyright © 2020 Abbie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KonyWebViewController : UIViewController
@property (strong, nonatomic) NSString *productURL;
@property (strong, nonatomic) NSString *titleName;

@end

NS_ASSUME_NONNULL_END
