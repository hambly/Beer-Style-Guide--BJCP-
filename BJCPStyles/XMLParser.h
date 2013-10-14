//
//  XMLParser.h
//  BJCPStyles
//
//  Created by Mark on 3/7/13.
//  Copyright (c) 2013 Mark Hambly. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BJCPCategory;
@class BJCPStyle;
@class BJCPCategoryListViewController;

@interface XMLParser : NSObject <NSXMLParserDelegate> {
    
	NSMutableString *currentElementValue;
	BJCPCategory *theCategory;
    BJCPStyle *theStyle;
    NSString *currentStat;
}

@property (nonatomic, retain) BJCPCategoryListViewController *appDelegate;

- (XMLParser *) initXMLParser;

@end
