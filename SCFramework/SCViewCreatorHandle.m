//
//  SCViewCreatorHandle.m
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "SCViewCreatorHandleInternal.h"

////////////////////////////////////////////////////////////
// PRIVATE DEFINITION
/////////////////////


////////////////////////////////////////////////////////////
// IMPLEMENTATION
/////////////////////

@implementation SCViewCreatorHandle

@synthesize onCellCreated;
@synthesize reuseIdentifier;
@synthesize viewCreator;
@synthesize dataDisplayerHandler;
@synthesize sectionIndex;

- (id) init {
    return [self initWithReuseIdentifier:nil viewCreator:nil cellCreatedCb:nil instantiationPredicate:nil];
}

- (id) initWithReuseIdentifier:(NSString *)aReuseIdentifier viewCreator:(ViewCreator)aViewCreator cellCreatedCb:(CellCreated)cellCreated instantiationPredicate:(InstantiationPredicate)instantiationPredicate {
    self = [super init];
    
    if (self) {
        self.reuseIdentifier = aReuseIdentifier;
        self.viewCreator = aViewCreator;
        self.onCellCreated = cellCreated;
        self.instantiationPredicate = instantiationPredicate;
    }

    return self;
}

- (id<SCDataModelDisplayer>) createDataModelDisplayer:(NSInteger)index data:(id)data {
    id<SCDataModelDisplayer> dataModelDisplayer = nil;
    
    // First, we try using the reuseIdentifier
    if (self.reuseIdentifier != nil) {
        dataModelDisplayer = [self.dataDisplayerHandler dequeueDataModelDisplayerForIdentifier:self.reuseIdentifier];
        
    }
    
    // Secondly, we use the view creator
    if (dataModelDisplayer == nil && self.viewCreator != nil) {
        dataModelDisplayer = self.viewCreator(index, self.sectionIndex, data);
    }
    
    if (dataModelDisplayer != nil && self.onCellCreated != nil) {
        self.onCellCreated(dataModelDisplayer, index, self.sectionIndex);
    }
    
    return dataModelDisplayer;
}

- (void) setInstantiationPredicate:(InstantiationPredicate)newInstantiationPredicate {
    if (newInstantiationPredicate == nil) {
        
        newInstantiationPredicate = ^(NSInteger index, id data) {
            return YES;
        };
    }
    _instanciationPredicate = newInstantiationPredicate;
}

- (InstantiationPredicate) instantiationPredicate {
    return _instanciationPredicate;
}

@end
