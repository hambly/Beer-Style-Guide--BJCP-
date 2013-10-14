//
//  XMLParser.m
//  BJCPStyles
//
//  Created by Mark on 3/7/13.
//  Copyright (c) 2013 Mark Hambly. All rights reserved.
//

#import "XMLParser.h"
#import "BJCPCategory.h"
#import "BJCPStyle.h"
#import "BJCPCategoryListViewController.h"

@implementation XMLParser
@synthesize appDelegate;

- (XMLParser *) initXMLParser {
	
	self = [super init];
	if (self) {

	}
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
	attributes:(NSDictionary *)attributeDict {
	
    
	if([elementName isEqualToString:@"category"]) {
        theCategory = [[BJCPCategory alloc] init];
        theCategory.categoryID = [[attributeDict objectForKey:@"id"] integerValue];
//            NSLog(@"Reading category ID: %d", theCategory.categoryID);
        
	} else if ([elementName isEqualToString:@"subcategory"]) {
        theStyle = [[BJCPStyle alloc] init];
        theStyle.subcategoryID = [attributeDict objectForKey:@"id"];
//        NSLog(@"Reading Style ID: %@", theStyle.subcategoryID);
    } else if ([elementName isEqualToString:@"og"]) {
        currentStat = @"og";
        theStyle.ogFlex = [[attributeDict objectForKey:@"flexible"] boolValue];
    } else if ([elementName isEqualToString:@"fg"]) {
        currentStat = @"fg";
        theStyle.fgFlex = [[attributeDict objectForKey:@"flexible"] boolValue];
    } else if ([elementName isEqualToString:@"ibu"]) {
        currentStat = @"ibu";
        theStyle.ibuFlex = [[attributeDict objectForKey:@"flexible"] boolValue];
    } else if ([elementName isEqualToString:@"srm"]) {
        currentStat = @"srm";
        theStyle.srmFlex = [[attributeDict objectForKey:@"flexible"] boolValue];
    } else if ([elementName isEqualToString:@"abv"]) {
        currentStat = @"abv";
        theStyle.abvFlex = [[attributeDict objectForKey:@"flexible"] boolValue];
    }
	
//	NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
    string =[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if(!currentElementValue)
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else
		[currentElementValue appendString:string];
	
//	NSLog(@"Processing Value: %@", currentElementValue);
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	
	if([elementName isEqualToString:@"category"]) {
        [appDelegate.categories addObject:theCategory];
    
        
    } else if ([elementName isEqualToString:@"subcategory"]) {
        [theCategory.styles addObject:theStyle];
//        NSLog(@"%@ added to %@", theStyle, theCategory);
        
        
    } else if ([elementName isEqualToString:@"name"]) {
        if (![theCategory categoryName]) {
            [theCategory setCategoryName:currentElementValue];
            
//            NSLog(@"Category %@",[theCategory categoryName]);
        } else {
            [theStyle setName:currentElementValue];
            [theStyle setCategory:[theCategory categoryName]];
//            NSLog(@"Style %@", [theStyle name]);
        }

    } else if ([elementName isEqualToString:@"aroma"]) {
        theStyle.aroma = currentElementValue;
    } else if ([elementName isEqualToString:@"appearance"]) {
        theStyle.appearance = currentElementValue;
    } else if ([elementName isEqualToString:@"flavor"]) {
        theStyle.flavor = currentElementValue;
    } else if ([elementName isEqualToString:@"mouthfeel"]) {
        theStyle.mouthfeel = currentElementValue;
    } else if ([elementName isEqualToString:@"impression"]) {
        theStyle.impression = currentElementValue;
    } else if ([elementName isEqualToString:@"history"]) {
        theStyle.history = currentElementValue;
    } else if ([elementName isEqualToString:@"comments"]) {
        theStyle.comments = currentElementValue;
    } else if ([elementName isEqualToString:@"ingredients"]) {
        theStyle.ingredients = currentElementValue;
    } else if ([elementName isEqualToString:@"low"]) {
        if ([currentStat isEqualToString:@"og"]){
            theStyle.ogLow = [currentElementValue doubleValue];
            
        } else if ([currentStat isEqualToString:@"fg"]) {
            theStyle.fgLow = [currentElementValue doubleValue];
            
        } else if ([currentStat isEqualToString:@"ibu"]) {
            theStyle.ibuLow = [currentElementValue doubleValue];
            
        } else if ([currentStat isEqualToString:@"srm"]) {
            theStyle.srmLow = [currentElementValue doubleValue];
            
        } else if ([currentStat isEqualToString:@"abv"]) {
            theStyle.abvLow = [currentElementValue doubleValue];
          
        } 
    } else if ([elementName isEqualToString:@"high"]) {
        if ([currentStat isEqualToString:@"og"]){
            theStyle.ogHigh = [currentElementValue doubleValue];
            
        } else if ([currentStat isEqualToString:@"fg"]) {
            theStyle.fgHigh = [currentElementValue doubleValue];
            
        } else if ([currentStat isEqualToString:@"ibu"]) {
            theStyle.ibuHigh = [currentElementValue doubleValue];
            
        } else if ([currentStat isEqualToString:@"srm"]) {
            theStyle.srmHigh = [currentElementValue doubleValue];
            
        } else if ([currentStat isEqualToString:@"abv"]) {
            theStyle.abvHigh = [currentElementValue doubleValue];
            
        }
    } else if ([elementName isEqualToString:@"examples"]){
        theStyle.examples = currentElementValue;
    }

	currentElementValue = nil;
}


@end
