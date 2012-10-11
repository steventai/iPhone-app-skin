//
//  ContrastController.m
//  PhoneAppSkin
//
//  Created by steventai on 12/9/17.
//  Copyright (c) 2012年 steventai. All rights reserved.
//

#import "ContrastController.h"

@interface ContrastController ()

@end

@implementation ContrastController
@synthesize tableData = _tableData;
@synthesize phraseData = _phraseData;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _tableData = [[NSMutableArray alloc] init];
    _phraseData = [[NSMutableArray alloc] init];
    
    NSArray *firstLatinWords = [NSArray arrayWithObjects:@"Lorem", @"Ipsum", @"Dolor", @"Amet", @"Consectetur", @"Adipiscing", @"Elit", @"Quisque", nil];
    NSArray *secondLatinWords = [NSArray arrayWithObjects:@"0935-123456", @"0958-123456", @"0935-567891", @"0935-123123", @"0935-123334", @"0935-121212", @"0922-123456", @"0911-654321",  nil];
    
    for (NSInteger i=0; i < 8; i++) {
        

        
        [_phraseData addObject:[NSString stringWithFormat:@"%@", [firstLatinWords objectAtIndex:i]]];
        
        [_tableData addObject:[NSString stringWithFormat:@"%@", [secondLatinWords objectAtIndex:i]]];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.tableData = nil;
    self.phraseData = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    [tableView registerNib:[UINib nibWithNibName:@"NewCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    /*
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     
     if (cell == nil) {
     //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
     //        cell = [[[NSBundle mainBundle] loadNibNamed:@"NewCell" owner:self options:nil] lastObject];
     UINib *theNib = [UINib nibWithNibName:@"NewCell" bundle:nil];
     cell = [[theNib instantiateWithOwner:self options:nil] lastObject];
     }
     */
    // Configure the cell...
    NSString *phonename = [self.phraseData objectAtIndex:indexPath.row %8];
    NSString *phonenum = [self.tableData objectAtIndex:indexPath.row %8];

    
    UILabel *theTitleLabel = (UILabel *)[cell viewWithTag:1000];
    UILabel *theSubtitle = (UILabel *)[cell viewWithTag:1010];

    
    [theTitleLabel setText:phonename];
    [theSubtitle setText:phonenum];

  //  [theTitleLabel setText:[NSString stringWithFormat:@"Row %d", indexPath.row]];
  //  [theSubtitle setText:[NSString stringWithFormat:@"Number %d", indexPath.row]];
        
    UIImageView *myImageView = (UIImageView *)[cell viewWithTag:1030];
    [myImageView setImage:[UIImage imageNamed:@"contast-bk.png"]];
    
    //UIImageView *cellBackground = (UIImageView *)[cell viewWithTag:1020];
    //cellBackground.image = [UIImage imageNamed:@"yelp"];
    return cell;

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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
