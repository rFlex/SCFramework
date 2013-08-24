//
//  SCSectionInternal.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/14/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCSection.h"

@interface SCSection () {
    SCViewCreatorHandle * _loadingViewCreator;
}

@property (strong, nonatomic) NSMutableArray * mutableViewCreators;
@property (assign, nonatomic) NSInteger sectionIndex;
@property (weak, nonatomic) SCListDataDisplayerHandler * dataDisplayerHandler;

@end
