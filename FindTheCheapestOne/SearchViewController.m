//
//  SearchViewController.m
//  FindTheCheapestOne
//
//  Created by iMac on 6/15/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import "SearchViewController.h"
#import "ResultsTableViewController.h"



@interface SearchViewController ()


@end



@implementation SearchViewController
@synthesize searchedItem, searchButton, activityInd;


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    textField.delegate = self;
    [textField resignFirstResponder];
    
    return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    searchedItem.delegate = self;
    activityInd.hidden = YES;
   
    [super viewWillAppear:animated];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    
    

    
    
    // Do any additional setup after loading the view.
}



-(IBAction)ClickBtn:(UIButton *)sender
{
    sender.selected  = ! sender.selected;
    
    if (sender.selected)
    {
        
        activityInd.hidden = NO;
        [activityInd startAnimating];
        
        [self performSelector:@selector(prepareForSegue:sender:) withObject:nil afterDelay:2.0];
       
        NSLog(@"Button selected");
    

    }
    else
    {
        
    }
}

- (void) goToNextPage:(UIStoryboardSegue *)segue sender:(id)sender
{
  
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"next"])
    {
        [searchedItem resignFirstResponder];
        ResultsTableViewController *tableVC = (ResultsTableViewController *)segue.destinationViewController;
        
        NSString *urlString = [NSString stringWithFormat:@"http://us.api.invisiblehand.co.uk/v1/products?query=%@&app_id=dad00cb7&app_key=ab386c3e1b99b58b876f237d77b4211a", [[searchedItem.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"]];
        
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        NSArray *itemCallArray = [NSArray arrayWithArray:dataDictionary[@"results"]];
        
        NSMutableArray *titleArray = [[NSMutableArray alloc] init];
        for (NSDictionary *theItem in itemCallArray)
        {
            NSString *titleString = theItem[@"title"];
            
            
            if (titleString != (id)[NSNull null] && titleString.length != 0 )
            {
                
                [titleArray addObject:titleString];
                
                
                
            }
            
            [tableVC setArray:titleArray];
            
            [tableVC setArray2:itemCallArray];
            [tableVC setTheUrlString: urlString];
        }
    }

   }



    






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


@end
