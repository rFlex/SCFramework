//
//  SCListDataDisplayerHandler.m
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "SCListDataDisplayerHandlerInternal.h"
#import "SCSectionInternal.h"

////////////////////////////////////////////////////////////
// PRIVATE DEFINITION
/////////////////////


////////////////////////////////////////////////////////////
// IMPLEMENTATION
/////////////////////

@implementation SCListDataDisplayerHandler

@synthesize sections;

- (id<SCDataModelDisplayer>) dequeueDataModelDisplayerForIdentifier:(NSString *)identifier {
    return nil;
}

- (id<SCDataModelDisplayer>) createDataModelDisplayerAtIndex:(NSInteger)index forSection:(NSInteger)sectionIndex {
    SCSection * section = [self.sections objectAtIndex:sectionIndex];
    id data = nil;
    id<SCDataModelDisplayer> dataModelDisplayer = nil;
    
    if (index >= 0 && index < section.dataSource.dataSet.count) {
        data = [section.dataSource.dataSet objectAtIndex:index];
        dataModelDisplayer = [section createDataModelDisplayerAtIndex:index forData:data];
    } else {
        dataModelDisplayer = [section.loadingViewCreator createDataModelDisplayer:index data:nil];
        [section.dataSource load];
    }
    
    if (dataModelDisplayer != nil) {
        dataModelDisplayer.data = data;
        [dataModelDisplayer rebuildFromData];
    }
    
    return dataModelDisplayer;
}

- (id) addSection {
    SCSection * section = [self createSection];
    
    assert(section != nil);
    
    section.dataDisplayerHandler = self;
    section.sectionIndex = self.sections.count;
    
    [self.sections addObject:section];
    
    return section;
}

- (SCSection*) createSection {
    return [[SCSection alloc] init];
}

@end