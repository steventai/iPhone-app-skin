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
    

    // Configure the cell...
    NSString *phonename = [self.phraseData objectAtIndex:indexPath.row %8];
    NSString *phonenum = [self.tableData objectAtIndex:indexPath.row %8];

    
    UILabel *theTitleLabel = (UILabel *)[cell viewWithTag:1000];
    UILabel *theSubtitle = (UILabel *)[cell viewWithTag:1010];

    
    [theTitleLabel setText:phonename];
    [theSubtitle setText:phonenum];

        
    UIImageView *myImageView = (UIImageView *)[cell viewWithTag:1030];
    [myImageView setImage:[UIImage imageNamed:@"contast-bk.png"]];
    
    return cell;

}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
}

@end
