//
//  BJCPStyleListViewController.m
//  BJCPStyles
//
//  Created by Mark on 3/8/13.
//  Copyright (c) 2013 Mark Hambly. All rights reserved.
//

#import "BJCPStyleListViewController.h"
#import "BJCPCategory.h"
#import "BJCPStyle.h"
#import "BJCPStyleViewController.h"

@implementation BJCPStyleListViewController
@synthesize theCategory;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [[self navigationItem] setTitle:[theCategory categoryName]];

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[theCategory styles] count];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 36;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StyleCell"];
    
    // Configure the cell...
    
    theStyle = [[theCategory styles] objectAtIndex: [indexPath row]];
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@ - %@", [theStyle subcategoryID],[theStyle name]]];
    [[cell textLabel] setFont:[UIFont systemFontOfSize:15]];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    BJCPStyleViewController *svc = [[BJCPStyleViewController alloc] initWithNibName:nil bundle:nil];
    
    [svc setTheStyle:[[theCategory styles] objectAtIndex: [indexPath row]]];
    
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:svc animated:YES];
}

@end
