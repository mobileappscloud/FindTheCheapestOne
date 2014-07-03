//
//  ShareViewController.h
//  FindTheCheapestOne
//
//  Created by iMac on 7/2/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>
#import <Accounts/Accounts.h>

@interface ShareViewController : UIViewController
{
    SLComposeViewController *mySLComposerSheet;
}
- (IBAction)shareFacebook:(id)sender;
- (IBAction)shareTwitter:(id)sender;
- (IBAction)shareEmail:(id)sender;

@end
