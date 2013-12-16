//
//  SCDataSourceHandle.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCDataSet.h"

@protocol SCDataSourceHandle;

@protocol SCDataSourceHandleDelegate <NSObject>

- (void) dataSource:(id<SCDataSourceHandle>)dataSource willStartFeeding:(id<SCDataSet>)dataSet;
- (void) dataSource:(id<SCDataSourceHandle>)dataSource didEndFeeding:(id<SCDataSet>)dataSet;
- (void) dataSource:(id<SCDataSourceHandle>)dataSource didFailLoading:(id<SCDataSet>)dataSet loadingError:(NSError*)error;

@end

// A DataSourceHandle is a class that hold data and is responsible
// for feeding its data when needed.
@protocol SCDataSourceHandle <NSObject>

@optional

- (void) removeDataSet:(id<SCDataSet>)dataSet;
- (void) feedWithSingleData:(id)data;
- (void) feedWithSingleData:(id)data atPageIndex:(NSInteger)index;
- (void) feedWithArray:(NSArray*)array;
- (void) feedWithArray:(NSArray*)array atPageIndex:(NSInteger)index;
- (void) feedWithDataSet:(id<SCDataSet>)dataSet;

@property (weak, nonatomic) id<SCDataSourceHandleDelegate> delegate;

// Ask the DataSourceHandle to load more data if the DataSourceHandle is not complete
- (void) load;

@required

@property (assign, nonatomic, readonly) BOOL dataSetIsComplete;

// The underlaying dataset
@property (strong, nonatomic, readonly) id<SCDataSet> dataSet;

@end

