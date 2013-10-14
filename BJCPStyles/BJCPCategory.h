//
//  BJCPStyle.h
//  BJCPStyles
//
//  Created by Mark on 3/7/13.
//  Copyright (c) 2013 Mark Hambly. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BJCPStyle;

@interface BJCPCategory : NSObject {
    
}

@property (nonatomic, readwrite) NSInteger categoryID;
@property (nonatomic, retain) NSString *categoryName;
@property (nonatomic, retain) NSMutableArray *styles;

@end
