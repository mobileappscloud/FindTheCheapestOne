//
//  SearchViewController.h
//  FindTheCheapestOne
//
//  Created by iMac on 6/15/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchedItem;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityInd;
- (IBAction)ClickBtn:(UIButton *)sender;

@end
