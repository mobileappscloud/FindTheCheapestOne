//
//  WebViewController.h
//  FindTheCheapestOne
//
//  Created by iMac on 6/28/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *theWebView;
@property (nonatomic, strong)NSString *webSiteURL;

@end
