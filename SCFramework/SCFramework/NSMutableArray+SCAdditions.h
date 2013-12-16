//
//  NSArray+SCAdditions.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/24/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray(SCAdditions)

- (NSUInteger) removeAllForPredicate:(BOOL(^)(id element))predicate;

@end
