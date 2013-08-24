//
//  SCViewCreatorHandle.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCDataModelDisplayer.h"

// Typedef
typedef id<SCDataModelDisplayer> (^ViewCreator)(NSInteger index, NSInteger sectionIndex, id data);
typedef void (^CellCreated)(id<SCDataModelDisplayer> dataModelDisplayer, NSInteger index, NSInteger sectionIndex);
typedef BOOL (^InstantiationPredicate)(NSInteger index, id data);

// Class definition

@interface SCViewCreatorHandle : NSObject {
    
}

- (id) initWithReuseIdentifier:(NSString*)reuseIdentifier viewCreator:(ViewCreator)viewCreator
                 cellCreatedCb:(CellCreated)cellCreated
        instantiationPredicate:(InstantiationPredicate)instantiationPredicate;

- (id<SCDataModelDisplayer>) createDataModelDisplayer:(NSInteger)index data:(id)data;

@property (copy, nonatomic) NSString * reuseIdentifier;
@property (assign, nonatomic) ViewCreator viewCreator;
@property (assign, nonatomic) CellCreated onCellCreated;
@property (assign, nonatomic) InstantiationPredicate instantiationPredicate;

@end
