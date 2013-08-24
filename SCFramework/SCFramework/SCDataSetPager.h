//
//  SCDataSetPager.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/13/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCDataSet.h"

@interface SCDataSetPager : NSObject<SCMutableDataSet>

- (void) insertDataSet:(id<SCDataSet>)dataSet;

@end
