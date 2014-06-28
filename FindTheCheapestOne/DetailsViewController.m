//
//  DetailsViewController.m
//  FindTheCheapestOne
//
//  Created by iMac on 6/26/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import "DetailsViewController.h"
#import "WebViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController
@synthesize itemBrand, itemImageView, itemName, itemPrice, URLString, itemDisplayImage, theItemBrand, theItemName, theItemPrice, webURLString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    itemBrand.text = theItemBrand;
    itemPrice.text = theItemPrice;
    itemName.text = theItemName;
    [itemImageView setImage:itemDisplayImage];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"show"]) {
        WebViewController *WVC = (WebViewController *)segue.destinationViewController;
        [WVC setWebSiteURL:webURLString];
         
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)purchaseItem:(id)sender {
}
@end
