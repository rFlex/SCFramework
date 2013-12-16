//
//  SCDataSourceHandle.m
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "SCDataSourceHandleImpl.h"
#import "SCDataSets.h"
#import "SCDataSetPager.h"

////////////////////////////////////////////////////////////
// PRIVATE DEFINITION
/////////////////////

@interface SCDataSourceHandleImpl() {
    
}

@property (strong, nonatomic) SCDataSetPager * dataSetPager;

@end

////////////////////////////////////////////////////////////
// IMPLEMENTATION
/////////////////////

@implementation SCDataSourceHandleImpl

@synthesize delegate;

- (id) init {
    self = [super init];
    
    if (self) {
        self.dataSetPager = [[SCDataSetPager alloc] init];
    }
    
    return self;
}

- (void) dealloc {
    self.dataSetPager = nil;
}

- (void) load {
    
}

- (void) feedWithArray:(NSArray *)array {
    [self feedWithArray:array atPageIndex:self.dataSetPager.pageIndex];
}

- (void) feedWithArray:(NSArray *)array atPageIndex:(NSInteger)index {
    [self feedWithDataSet:[array wrappedDataSetAtPageIndex:index withPageCount:self.dataSetPager.pageCount + 1]];
}

- (void) feedWithSingleData:(id)data {
    [self feedWithSingleData:data atPageIndex:self.dataSetPager.pageIndex];
}

- (void) feedWithSingleData:(id)data atPageIndex:(NSInteger)index {
	if (data == nil) {
		data = [NSNull null];
	}
    [self feedWithDataSet:[SCDataSets dataSetFromObject:data atPageIndex:index withpageCount:self.dataSetPager.pageCount + 1]];
}

- (void) feedWithDataSet:(id<SCDataSet>)dataSet {
    if ([self.delegate respondsToSelector:@selector(dataSource:willStartFeeding:)]) {
        [self.delegate dataSource:self willStartFeeding:dataSet];
    }
    
    [self.dataSetPager insertDataSet:dataSet];
    
    if ([self.delegate respondsToSelector:@selector(dataSource:didEndFeeding:)]) {
        [self.delegate dataSource:self didEndFeeding:dataSet];
    }
}

- (BOOL) dataSetIsComplete {
    return self.dataSetPager.pageIndex >= self.dataSetPager.pageCount;
}

- (id<SCDataSet>) dataSet {
    return self.dataSetPager;
}

@end
