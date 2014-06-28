//
//  ResultsTableViewController.m
//  FindTheCheapestOne
//
//  Created by iMac on 6/26/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import "ResultsTableViewController.h"
#import "NiceTableViewCell.h"
#import "SearchViewController.h"

@interface ResultsTableViewController ()

@end

@implementation ResultsTableViewController
@synthesize brandString, nameString, priceString, cellImageView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)setArray:(NSMutableArray *)a
{
    
    objectTitlesArray = a;
    
    
}

-(void)setArray2:(NSArray *)b
{
    resultsArray = b;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView reloadData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return objectTitlesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *NiceTableIdentifier = @"SimpleTableCell";
    
    NiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NiceTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NiceTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    
   
    
    for (NSDictionary *objItem in resultsArray)
    {
         NSString *currentItemName = [objectTitlesArray objectAtIndex:indexPath.row];
        
        if ([currentItemName isEqualToString:objItem[@"title"]])
        {
            if (cell.priceLabel.text != (id)[NSNull null] && cell.priceLabel.text.length != 0 && cell.brandLabel.text != (id)[NSNull null] && cell.brandLabel.text.length != 0)
            {

            
            cell.nameLabel.text = currentItemName;
           
                NSDictionary *bestPageDictionary = objItem[@"best_page"];
             
           
                NSNumber *price = bestPageDictionary[@"price"];
                
                if ((cell.priceLabel.text = @"<null>")) {
                    
                    cell.priceLabel.text = @"Price Unkown";
                }
                else
                {
                cell.priceLabel.text = [NSString stringWithFormat:@"$%@", price];
                }
                
                
            
                
                NSArray *brandsArray = objItem[@"brands"];
            cell.brandLabel.text = [brandsArray firstObject];
                
                NSString *urlString = bestPageDictionary[@"image_url"];
                NSURL *imageURL = [NSURL URLWithString:urlString];
                NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                UIImage *imageForCell = [UIImage imageWithData:imageData];
                [cell.cellImage setImage:imageForCell];
            }
            
        }
    }
    
   // cell.brandLabel.text = brandString;
    
  //  cell.priceLabel.text = priceString;
    
 //   cell.cellImage = cellImageView;
    
    
    
    
    
    // Configure the cell...
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
