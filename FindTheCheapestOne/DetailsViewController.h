//
//  DetailsViewController.h
//  FindTheCheapestOne
//
//  Created by iMac on 6/26/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;

@property (weak, nonatomic) UIImage *itemDisplayImage;
@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) NSString *theItemName;

@property (weak, nonatomic) IBOutlet UILabel *itemPrice;
@property (weak, nonatomic) NSString *theItemPrice;

@property (weak, nonatomic) IBOutlet UILabel *itemBrand;
@property (weak, nonatomic)NSString *theItemBrand;
- (IBAction)purchaseItem:(id)sender;
@property (strong, nonatomic)NSString *URLString;

@property (nonatomic, strong)NSString *webURLString;

@end
