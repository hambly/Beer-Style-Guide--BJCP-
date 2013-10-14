//
//  BJCPStyleListViewController.m
//  BJCPStyles
//
//  Created by Mark on 3/7/13.
//  Copyright (c) 2013 Mark Hambly. All rights reserved.
//

#import "BJCPCategoryListViewController.h"
#import "XMLParser.h"
#import "BJCPCategory.h"
#import "BJCPStyleListViewController.h"

@implementation BJCPCategoryListViewController
@synthesize categories;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        categories = [[NSMutableArray alloc] init];
        
        [[self navigationItem] setTitle:NSLocalizedString(@"BJCP Styles", @"Name of application")];
        
        NSString * filePath = [ [ NSBundle mainBundle ] pathForResource: @"styleguide2008" ofType: @"xml" ];
        NSData *styleGuide = [NSData dataWithContentsOfFile:filePath];
        
        NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:styleGuide];
        
        XMLParser *parser = [[XMLParser alloc] initXMLParser];
        
        [xmlParser setDelegate:parser];
        [parser setAppDelegate:self];
        
        BOOL success = [xmlParser parse];
        
        if(success)
            NSLog(@"No Errors");
        else
            NSLog(@"Error Error Error!!!");
        
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];

}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [categories count];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 36;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CategoryCell"];
    
    // Configure the cell...
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"%d - %@", [[categories objectAtIndex:[indexPath row]] categoryID],[[categories objectAtIndex:[indexPath row]] categoryName]]];
    [[cell textLabel] setFont:[UIFont systemFontOfSize:15]];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     BJCPStyleListViewController *slvc = [[BJCPStyleListViewController alloc] initWithNibName:nil bundle:nil];
    
    [slvc setTheCategory:[categories objectAtIndex:[indexPath row]]];
    
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:slvc animated:YES];
     
}

@end
