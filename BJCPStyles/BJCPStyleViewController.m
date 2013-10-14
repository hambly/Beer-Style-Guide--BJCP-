//
//  BJCPStyleViewController.m
//  BJCPStyles
//
//  Created by Mark on 3/8/13.
//  Copyright (c) 2013 Mark Hambly. All rights reserved.
//

#import "BJCPStyleViewController.h"
#import "BJCPStyle.h"


@implementation BJCPStyleViewController
@synthesize theStyle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [nameLabel setText:[theStyle name]];
    [categoryLabel setText:[NSString stringWithFormat:@"%@ - %@",[theStyle category], [theStyle subcategoryID]]];
    [ogLabel setText:[NSString stringWithFormat:@"OG: %.3f - %.3f %@", [theStyle ogLow], [theStyle ogHigh], ([theStyle ogFlex] ? @"(Flexible)" : @"")]];
    [fgLabel setText:[NSString stringWithFormat:@"FG: %.3f - %.3f %@", [theStyle fgLow], [theStyle fgHigh], ([theStyle fgFlex] ? @"(Flexible)" : @"")]];
    
    [ibuLabel setText:[NSString stringWithFormat:@"IBU: %.1f - %.1f %@", [theStyle ibuLow], [theStyle ibuHigh], ([theStyle ibuFlex] ? @"(Flexible)" : @"")]];
    
    [srmLabel setText:[NSString stringWithFormat:@"SRM: %.1f - %.1f %@", [theStyle srmLow], [theStyle srmHigh], ([theStyle srmFlex] ? @"(Flexible)" : @"")]];
    
    [abvLabel setText:[NSString stringWithFormat:@"ABV: %.1f - %.1f%% %@", [theStyle abvLow], [theStyle abvHigh], ([theStyle abvFlex] ? @"(Flexible)" : @"")]];
    
    [notesField setText:[NSString stringWithFormat:@"Aroma: %@\n\nAppearance: %@\n\nFlavor: %@\n\nMouthfeel: %@\n\nImpression: %@\n\nHistory: %@\n\nComments: %@\n\nIngredients: %@\n\nExamples: %@",[theStyle aroma], [theStyle appearance], [theStyle flavor], [theStyle mouthfeel], [theStyle impression], [theStyle history], [theStyle comments], [theStyle ingredients], [theStyle examples]]];
    
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
