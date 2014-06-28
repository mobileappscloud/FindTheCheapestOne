//
//  ResultsTableViewController.h
//  FindTheCheapestOne
//
//  Created by iMac on 6/26/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *objectTitlesArray;
    NSArray *resultsArray;
    
}

-(void)setArray:(NSMutableArray *)a;
-(void)setArray2:(NSArray *)b;
@property (nonatomic, strong)NSString *nameString;
@property (nonatomic, strong)NSString *priceString;
@property (nonatomic, strong)NSString *brandString;
@property (nonatomic, strong) UIImageView *cellImageView;
@property (nonatomic, strong) NSString *theUrlString;

@end
