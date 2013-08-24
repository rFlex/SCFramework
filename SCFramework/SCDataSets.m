//
//  SCDataSets.m
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "SCDataSets.h"

////////////////////////////////////////////////////////////
// PRIVATE DEFINITION
/////////////////////



////////////////////////////////////////////////////////////
// IMPLEMENTATION
/////////////////////

@implementation SCDataSets

+ (id<SCDataSet>) dataSetFromArray:(NSArray *)array atPageIndex:(NSInteger)index withPageCount:(NSInteger)pageCount {
    return [SCArrayDataSet arrayDataSetWithArray:array pageIndex:index pageCount:pageCount];
}

+ (id<SCDataSet>) dataSetFromObject:(id)object atPageIndex:(NSInteger)index withpageCount:(NSInteger)pageCount {
    return [SCObjectDataSet objectDataSetWithObject:object pageIndex:index pageCount:pageCount];
}

+ (id<SCMutableDataSet>) mutableDataSetFromMutableArray:(NSMutableArray *)mutableArray atPageIndex:(NSInteger)pageIndex withPageCount:(NSInteger)pageCount {
    return [SCMutableDataSet mutableDataSetWithMutableArray:mutableArray pageIndex:pageIndex pageCount:pageCount];
}

@end

@implementation NSArray(SCDataSetsAdditions)

- (id<SCDataSet>) wrappedDataSetAtPageIndex:(NSInteger)index withPageCount:(NSInteger)pageCount {
    return [SCDataSets dataSetFromArray:self atPageIndex:index withPageCount:pageCount];
}

@end

@implementation NSMutableArray(SCMutableDataSetsAdditions)

- (id<SCMutableDataSet>) wrappedMutableDataSetAtPageIndex:(NSInteger)index withPageCount:(NSInteger)pageCount {
    return [SCMutableDataSet mutableDataSetWithMutableArray:self pageIndex:index pageCount:pageCount];
}

@end

@implementation SCDataSetPageImpl

@synthesize pageCount;
@synthesize pageIndex;

- (id) objectAtIndex:(NSInteger)index {
    return nil;
}

- (NSInteger) count {
    return 0;
}

@end

@implementation SCArrayDataSet

@synthesize array;

- (id) initWithArray:(NSArray *)theArray pageIndex:(NSInteger)thePageIndex pageCount:(NSInteger)thePageCount {
    self = [super init];
    
    if (self) {
        self.array = theArray;
        self.pageIndex = thePageIndex;
        self.pageCount = thePageCount;
    }
    
    return self;
}

+ (SCArrayDataSet*) arrayDataSetWithArray:(NSArray *)array pageIndex:(NSInteger)pageIndex pageCount:(NSInteger)pageCount {
    return [[SCArrayDataSet alloc] initWithArray:array pageIndex:pageIndex pageCount:pageCount];
}

- (id) objectAtIndex:(NSInteger)index {
    return [self.array objectAtIndex:index];
}

- (NSInteger) count {
    return self.array.count;
}

@end

@implementation SCMutableDataSet

@synthesize mutableArray;

- (id) initWithMutableArray:(NSMutableArray *)theArray pageIndex:(NSInteger)thePageIndex pageCount:(NSInteger)thePageCount {
    self = [super init];
    
    if (self) {
        self.mutableArray = theArray;
        self.pageIndex = thePageIndex;
        self.pageCount = thePageCount;
    }
    
    return self;
}

+ (SCMutableDataSet*) mutableDataSetWithMutableArray:(NSMutableArray *)mutableArray pageIndex:(NSInteger)pageIndex pageCount:(NSInteger)pageCount {
    return [[SCMutableDataSet alloc] initWithMutableArray:mutableArray pageIndex:pageIndex pageCount:pageCount];
}

- (id) objectAtIndex:(NSInteger)index {
    return [self.mutableArray objectAtIndex:index];
}

- (void) removeObjectAtIndex:(NSInteger)index {
    [self.mutableArray removeObjectAtIndex:index];
}

- (NSInteger) count {
    return self.mutableArray.count;
}

@end

@implementation SCObjectDataSet

@synthesize object;

- (id) initWithObject:(id)theObject pageIndex:(NSInteger)thePageIndex pageCount:(NSInteger)thePageCount {
    self = [super init];
    
    if (self) {
        self.object = theObject;
        self.pageCount = thePageCount;
        self.pageIndex = thePageIndex;
    }
    
    return self;
}

+ (SCObjectDataSet*) objectDataSetWithObject:(id)object pageIndex:(NSInteger)pageIndex pageCount:(NSInteger)pageCount {
    return [[SCObjectDataSet alloc] initWithObject:object pageIndex:pageIndex pageCount:pageCount];
}

- (id) objectAtIndex:(NSInteger)index {
    return self.object;
}

- (NSInteger) count {
    return 1;
}

@end