//
//  BJCPStyleViewController.h
//  BJCPStyles
//
//  Created by Mark on 3/8/13.
//  Copyright (c) 2013 Mark Hambly. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BJCPStyle;

@interface BJCPStyleViewController : UIViewController {
    
    __weak IBOutlet UILabel *nameLabel;
    __weak IBOutlet UILabel *ogLabel;
    __weak IBOutlet UILabel *fgLabel;
    __weak IBOutlet UILabel *ibuLabel;
    __weak IBOutlet UILabel *srmLabel;
    __weak IBOutlet UILabel *abvLabel;
    __weak IBOutlet UITextView *notesField;
    __weak IBOutlet UILabel *categoryLabel;
}

@property (nonatomic, retain) BJCPStyle *theStyle;

@end
