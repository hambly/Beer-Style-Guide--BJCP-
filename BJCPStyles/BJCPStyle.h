//
//  BJCPStyle.h
//  BJCPStyles
//
//  Created by Mark on 3/8/13.
//  Copyright (c) 2013 Mark Hambly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJCPStyle : NSObject

@property (nonatomic, retain) NSString *category, *subcategoryID, *name, *aroma, *appearance, *flavor, *mouthfeel, *impression, *history, *comments, *ingredients, *examples;
@property (nonatomic) double ogLow, ogHigh, fgLow, fgHigh, ibuLow, ibuHigh, srmLow, srmHigh, abvLow, abvHigh;
@property (nonatomic) BOOL ogFlex, fgFlex, ibuFlex, srmFlex, abvFlex;

@end
