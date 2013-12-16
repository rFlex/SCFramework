//
//  SCViewCreatorHandle.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCDataModelDisplayer.h"
#import "SCAMethod.h"

// Class definition

@interface SCViewCreatorHandle : NSObject {
    
}

- (id) initWithReuseIdentifier:(NSString*)reuseIdentifier;
- (id) initWithReuseIdentifier:(NSString*)reuseIdentifier viewCreator:(AMethod(NSInteger data, NSInteger sectionIndex, id data))viewCreator;
- (id) initWithReuseIdentifier:(NSString*)reuseIdentifier viewCreator:(AMethod(NSInteger data, NSInteger sectionIndex, id data))viewCreator
                 cellCreatedCb:(AMethod())cellCreated;
- (id) initWithReuseIdentifier:(NSString*)reuseIdentifier viewCreator:(AMethod(NSInteger data, NSInteger sectionIndex, id data))viewCreator
                 cellCreatedCb:(AMethod())cellCreated
        instantiationPredicate:(AMethod(NSInteger index, id data))instantiationPredicate;

- (id<SCDataModelDisplayer>) createDataModelDisplayer:(NSInteger)index data:(id)data;

@property (copy, nonatomic) NSString * reuseIdentifier;
@property (assign, nonatomic) AMethod(NSInteger data, NSInteger sectionIndex, id data) viewCreator;
@property (assign, nonatomic) AMethod() onCellCreated;
@property (assign, nonatomic) AMethod(NSInteger index, id data) instantiationPredicate;

@end
