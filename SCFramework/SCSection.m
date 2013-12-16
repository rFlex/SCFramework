//
//  SCDataSection.m
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "SCSectionInternal.h"
#import "SCViewCreatorHandleInternal.h"
#import "SCDataSourceHandleImpl.h"

////////////////////////////////////////////////////////////
// PRIVATE DEFINITION
/////////////////////



////////////////////////////////////////////////////////////
// IMPLEMENTATION
/////////////////////

@implementation SCSection

@synthesize dataSource;
@synthesize sectionIndex;
@synthesize mutableViewCreators;
@synthesize dataDisplayerHandler;

- (id) init {
    self = [super init];
    
    if (self) {
		self.enabled = YES;
        self.mutableViewCreators = [[NSMutableArray alloc] init];
        self.dataSource = [[SCDataSourceHandleImpl alloc] init];
    }
    
    return self;
}

- (id<SCDataModelDisplayer>) createDataModelDisplayerAtIndex:(NSInteger)index forData:(id)data {
    SCViewCreatorHandle * viewCreatorHandle = [self getViewCreatorAtIndex:index forData:data];
    id<SCDataModelDisplayer> dataModelDisplayer = nil;
    
    if (viewCreatorHandle != nil) {
        dataModelDisplayer = [viewCreatorHandle createDataModelDisplayer:index data:data];
    }
    
    return dataModelDisplayer;
}

- (id) getDataForIndex:(NSInteger)index {
    id data = nil;
    
    if (index >= 0 && index < self.dataSource.dataSet.count) {
        return [self.dataSource.dataSet objectAtIndex:index];
    }
    
    return data;
}

- (SCViewCreatorHandle*) getViewCreatorAtIndex:(NSInteger)index forData:(id)data {
    if (self.dataDisplayerHandler.showDebug) {
        NSLog(@"Getting view creator at index %d for data %@", index, data);
    }
    
    if (index < 0) {
        return self.loadingViewCreator;
    }
    
    for (SCViewCreatorHandle * viewCreatorHandle in self.viewCreators) {
        if ([viewCreatorHandle.instantiationPredicate invoke:Boxed(index), data, nil]) {
            if (self.dataDisplayerHandler.showDebug) {
                NSLog(@"Returned %@ ", viewCreatorHandle.reuseIdentifier);
            }
            return viewCreatorHandle;
        } else if (self.dataDisplayerHandler.showDebug) {
            NSLog(@"%@ doesn't match", viewCreatorHandle.reuseIdentifier);
        }
    }
    
    if (self.dataDisplayerHandler.showDebug) {
        NSLog(@"NIL returned");
    }
    
    return nil;
}

- (void) addViewCreator:(SCViewCreatorHandle*)viewCreator {
    viewCreator.dataDisplayerHandler = self.dataDisplayerHandler;
    viewCreator.sectionIndex = self.sectionIndex;
    
    [self.mutableViewCreators addObject:viewCreator];
}

- (void) removeViewCreator:(SCViewCreatorHandle*)viewCreator {
    [self.mutableViewCreators removeObject:viewCreator];
}

- (SCViewCreatorHandle*) loadingViewCreator {
    return _loadingViewCreator;
}

- (void) setLoadingViewCreator:(SCViewCreatorHandle *)newLoadingViewCreator {
    _loadingViewCreator = newLoadingViewCreator;
    
    if (newLoadingViewCreator != nil) {
        newLoadingViewCreator.dataDisplayerHandler = self.dataDisplayerHandler;
        newLoadingViewCreator.sectionIndex = self.sectionIndex;
    }
}

- (NSArray*) viewCreators {
    return self.mutableViewCreators;
}

@end
