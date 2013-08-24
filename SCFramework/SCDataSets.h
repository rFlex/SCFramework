//
//  SCDataSets.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCDataSet.h"

@interface SCDataSets : NSObject

+ (id<SCDataSet>) dataSetFromArray:(NSArray*)array atPageIndex:(NSInteger)index
                     withPageCount:(NSInteger)pageCount;

+ (id<SCDataSet>) dataSetFromObject:(id)object atPageIndex:(NSInteger)index
                      withpageCount:(NSInteger)pageCount;

+ (id<SCMutableDataSet>) mutableDataSetFromMutableArray:(NSMutableArray*)mutableArray
                                            atPageIndex:(NSInteger)index
                                          withPageCount:(NSInteger)pageCount;

@end

@interface NSArray(SCDataSetsAdditions)

- (id<SCDataSet>) wrappedDataSetAtPageIndex:(NSInteger)index withPageCount:(NSInteger)pageCount;

@end

@interface NSMutableArray(SCMutableDataSetsAdditions)

- (id<SCMutableDataSet>) wrappedMutableDataSetAtPageIndex:(NSInteger)index withPageCount:(NSInteger)pageCount;

@end

//
// DataSets implementations
//

@interface SCDataSetPageImpl : NSObject<SCDataSet>

@property (assign, nonatomic) NSInteger pageIndex;
@property (assign, nonatomic) NSInteger pageCount;

@end

// NSArray
@interface SCArrayDataSet : SCDataSetPageImpl


+ (SCArrayDataSet*) arrayDataSetWithArray:(NSArray*)array
                                pageIndex:(NSInteger)pageIndex
                                pageCount:(NSInteger)pageCount;

- (id) initWithArray:(NSArray*)array
           pageIndex:(NSInteger)pageIndex
           pageCount:(NSInteger)pageCount;

@property (strong, nonatomic) NSArray * array;

@end

// NSMutableArray

@interface SCMutableDataSet : SCDataSetPageImpl<SCMutableDataSet>


+ (SCMutableDataSet*) mutableDataSetWithMutableArray:(NSMutableArray*)mutableArray
                                           pageIndex:(NSInteger)pageIndex
                                           pageCount:(NSInteger)pageCount;

- (id) initWithMutableArray:(NSMutableArray*)array pageIndex:(NSInteger)index
                  pageCount:(NSInteger)index;

@property (strong, nonatomic) NSMutableArray * mutableArray;

@end

// NSObject
@interface SCObjectDataSet : SCDataSetPageImpl

+ (SCObjectDataSet*) objectDataSetWithObject:(id)object
                                   pageIndex:(NSInteger)pageIndex
                                   pageCount:(NSInteger)pageCount;

- (id) initWithObject:(id)object pageIndex:(NSInteger)pageIndex pageCount:(NSInteger)pageCount;

@property (strong, nonatomic) id object;

@end