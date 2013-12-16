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

- (void) dealloc {
	NSLog(@"Dealloc view creator handle");
}

- (id) initWithReuseIdentifier:(NSString *)theReuseIdentifier {
	return [self initWithReuseIdentifier:theReuseIdentifier viewCreator:nil cellCreatedCb:nil instantiationPredicate:nil];
}

- (id) initWithReuseIdentifier:(NSString *)theReuseIdentifier viewCreator:(SCAMethod*)theViewCreator {
	return [self initWithReuseIdentifier:theReuseIdentifier viewCreator:theViewCreator cellCreatedCb:nil instantiationPredicate:nil];
}

- (id) initWithReuseIdentifier:(NSString *)theReuseIdentifier viewCreator:(SCAMethod*)theViewCreator cellCreatedCb:(SCAMethod*)cellCreated {
	return [self initWithReuseIdentifier:theReuseIdentifier viewCreator:theViewCreator cellCreatedCb:cellCreated instantiationPredicate:nil];
}

- (id) initWithReuseIdentifier:(NSString *)aReuseIdentifier viewCreator:(SCAMethod*)aViewCreator cellCreatedCb:(SCAMethod*)cellCreated instantiationPredicate:(SCAMethod*)instantiationPredicate {
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
    
	void * boxedIndex = Boxed(index);
	
    // Secondly, we use the view creator
    if (dataModelDisplayer == nil && self.viewCreator != nil) {
		dataModelDisplayer = [self.viewCreator invoke:boxedIndex, Boxed(self.sectionIndex), data, nil];
    }
    
    if (dataModelDisplayer != nil && self.onCellCreated != nil) {
		[self.onCellCreated invoke:Boxed(index), Boxed(self.sectionIndex), nil];
    }
    
    return dataModelDisplayer;
}

- (BOOL) defaultInstanciationPredicate:(NSInteger)index data:(id)data {
	NSLog(@"Default instanciation predicate?");
	return YES;
}

- (void) setInstantiationPredicate:(SCAMethod*)newInstantiationPredicate {
    if (newInstantiationPredicate == nil) {
        newInstantiationPredicate = [[SCAMethod alloc] initWithTarget:self selector:@selector(defaultInstanciationPredicate:data:)];
    }
	
    _instanciationPredicate = newInstantiationPredicate;
}

- (SCAMethod*) instantiationPredicate {
    return _instanciationPredicate;
}

@end
