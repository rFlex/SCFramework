//
//  SCViewCreatorHandleInternal.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCViewCreatorHandle.h"
#import "SCListDataDisplayerHandler.h"

@interface SCViewCreatorHandle () {
    InstantiationPredicate _instanciationPredicate;
}

@property (weak, nonatomic) SCListDataDisplayerHandler * dataDisplayerHandler;
@property (assign, nonatomic) NSInteger sectionIndex;

@end
