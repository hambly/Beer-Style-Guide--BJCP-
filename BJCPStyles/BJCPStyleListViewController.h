//
//  BJCPStyleListViewController.h
//  BJCPStyles
//
//  Created by Mark on 3/8/13.
//  Copyright (c) 2013 Mark Hambly. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BJCPCategory;
@class BJCPStyle;

@interface BJCPStyleListViewController : UITableViewController {
    BJCPStyle *theStyle;
}

@property (nonatomic, retain) BJCPCategory *theCategory;

@end
