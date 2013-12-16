//
//  SCDataSetPager.m
//  SCFramework
//
//  Created by Simon CORSIN on 8/13/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "SCDataSetPager.h"

////////////////////////////////////////////////////////////
// PRIVATE DEFINITION
/////////////////////

@interface SCDataSetPager()

@property (strong, nonatomic) NSMutableArray * pages;
@property (assign, nonatomic) NSInteger pageCount;
@property (assign, nonatomic) NSInteger count;

@end

////////////////////////////////////////////////////////////
// IMPLEMENTATION
/////////////////////

@implementation SCDataSetPager

@synthesize pageCount;
@synthesize pages;
@synthesize count;

- (id) init {
	self = [super init];
	
	if (self) {
		self.pages = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (void) dealloc {
    self.pages = nil;
}

- (void) insertDataSet:(id<SCDataSet>)dataSet {
    while (dataSet.pageIndex >= self.pages.count) {
        [self.pages addObject:[[NSMutableArray alloc] init]];
    }

    NSMutableArray * page = [self.pages objectAtIndex:dataSet.pageIndex];
    self.count -= page.count;
    [page removeAllObjects];
    for (int i = 0; i < dataSet.count; i++) {
        [page insertObject:[dataSet objectAtIndex:i] atIndex:i];
        self.count++;
    }
    self.pageCount = dataSet.pageCount;
}

- (id) objectAtIndex:(NSInteger)index {
    for (NSMutableArray * dataPage in self.pages) {
        if (index >= 0 && index < dataPage.count) {
            return [dataPage objectAtIndex:index];
        }
        index -= dataPage.count;
    }
    
    return nil;
}

- (void) removeObjectAtIndex:(NSInteger)index {
    for (NSMutableArray * dataPage in self.pages) {
        if (index >= 0 && index < dataPage.count) {
            [dataPage removeObjectAtIndex:index];
            self.count--;
            break;
        }
        index -= dataPage.count;
    }
}

- (NSInteger) computeNewSize {
    NSInteger currentCount = 0;
    
    for (NSMutableArray * dataPage in self.pages) {
        currentCount += dataPage.count;
    }
    
    return currentCount;
}

- (NSInteger) pageIndex {
    return self.pages.count;
}

@end
