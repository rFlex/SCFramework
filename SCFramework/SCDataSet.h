//
//  SCDataSet.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SCDataSet <NSObject>

- (id) objectAtIndex:(NSInteger)index;

@property (nonatomic, readonly) NSInteger count;

@property (nonatomic, readonly) NSInteger pageIndex;
@property (nonatomic, readonly) NSInteger pageCount;

@end

@protocol SCMutableDataSet <SCDataSet>

- (void) removeObjectAtIndex:(NSInteger)index;

@end