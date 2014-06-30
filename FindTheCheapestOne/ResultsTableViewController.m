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
#import "DetailsViewController.h"

@interface ResultsTableViewController ()

@end

@implementation ResultsTableViewController
@synthesize brandString, nameString, priceString, cellImageView, theUrlString;

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
                
               cell.priceLabel.text = [NSString stringWithFormat:@"$%@", price];
                
                if ([cell.priceLabel.text  isEqualToString:@"<null>"])
                {
                    cell.priceLabel.text = @"Price Unknown";
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"go"])
    {
        DetailsViewController *dVC = (DetailsViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        NSString *correctURLString = [NSString stringWithFormat:@"%@", theUrlString];
        NSURL *url = [NSURL URLWithString:correctURLString];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
    
        
        NSArray *itemCallArray = [NSArray arrayWithArray:dataDictionary[@"results"]];
        
    
        for (NSDictionary *theItem in itemCallArray)
        {
        NSString *currentItem = [objectTitlesArray objectAtIndex:indexPath.row];
            if ([currentItem isEqualToString:theItem[@"title"]])
            {
                NSArray *brandsArray = theItem[@"brands"];
                NSDictionary *bestPageDictionary = theItem[@"best_page"];
                
                
                NSNumber *price = bestPageDictionary[@"price"];
             //   NSString *zeePriceString = [NSString stringWithFormat:@"%@", price];
                

                [dVC setTheItemName:currentItem];
                [dVC setTheItemBrand:[brandsArray firstObject]];
                
            
                
                
                [dVC setTheItemPrice:[NSString stringWithFormat:@"%@", price]];
                
                
                NSString *imgurlString = bestPageDictionary[@"image_url"];
                NSURL *imageURL = [NSURL URLWithString:imgurlString];
                NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                UIImage *zeeimageForCell = [UIImage imageWithData:imageData];
                
                [dVC setItemDisplayImage:zeeimageForCell];
                
                NSString *webSiteUrlString = bestPageDictionary[@"original_url"];
                [dVC setWebURLString:webSiteUrlString];
                
                
            }
        }
        
       

        
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    [self performSegueWithIdentifier:@"go" sender:nil];
    
    
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
