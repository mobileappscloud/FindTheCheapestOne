//
//  NiceTableViewCell.h
//  FindTheCheapestOne
//
//  Created by iMac on 6/27/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NiceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *brandLabel;

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;


@end
