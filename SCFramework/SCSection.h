//
//  SCDataSection.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCDataSourceHandle.h"
#import "SCDataModelDisplayer.h"
#import "SCViewCreatorHandle.h"

@class SCListDataDisplayerHandler;

@interface SCSection : NSObject {
    
}

- (id<SCDataModelDisplayer>) createDataModelDisplayerAtIndex:(NSInteger)index forData:(id)data;
- (id) getDataForIndex:(NSInteger)index;
- (SCViewCreatorHandle*)  getViewCreatorAtIndex:(NSInteger)index forData:(id)data;

- (void) addViewCreator:(SCViewCreatorHandle*)viewCreator;
- (void) removeViewCreator:(SCViewCreatorHandle*)viewCreator;

@property (strong, nonatomic, readonly) NSArray * viewCreators;
@property (assign, nonatomic) BOOL showDebug;
@property (strong, nonatomic) id<SCDataSourceHandle> dataSource;
@property (assign, nonatomic) SCViewCreatorHandle * loadingViewCreator;

@end
