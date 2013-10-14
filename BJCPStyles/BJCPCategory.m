//
//  BJCPStyle.m
//  BJCPStyles
//
//  Created by Mark on 3/7/13.
//  Copyright (c) 2013 Mark Hambly. All rights reserved.
//

#import "BJCPCategory.h"
#import "BJCPStyle.h"

@implementation BJCPCategory
@synthesize categoryID, categoryName, styles;

-(id) init {
    self = [super init];
    if (self) {
        styles = [[NSMutableArray alloc] init];
    }
    
    return self;
}
@end