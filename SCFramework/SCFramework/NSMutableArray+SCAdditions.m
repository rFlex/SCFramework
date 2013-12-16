//
//  NSArray+SCAdditions.m
//  SCFramework
//
//  Created by Simon CORSIN on 8/24/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "NSMutableArray+SCAdditions.h"

@implementation NSMutableArray(SCAdditions)

- (NSUInteger) removeAllForPredicate:(BOOL (^)(id))predicate {
	NSMutableIndexSet * discardedItems = nil;
	
	NSUInteger index = 0;
	for (id element in self) {
		if (predicate(element)) {
			if (discardedItems == nil) {
				discardedItems = [NSMutableIndexSet indexSet];
			}
			[discardedItems addIndex:index];
		}
		index++;
	}
	
	if (discardedItems != nil) {
		[self removeObjectsAtIndexes:discardedItems];
	}
	
	return [discardedItems count];
}

@end
