//
//  SCListDataDisplayerHandler.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCDataModelDisplayer.h"
#import "SCSection.h"

@interface SCListDataDisplayerHandler : NSObject {
    
}

- (SCSection*) addSection;
- (SCSection*) getSectionForIndex:(NSUInteger)sectionIndex;

- (id<SCDataModelDisplayer>) dequeueDataModelDisplayerForIdentifier:(NSString*)identifier;
- (id<SCDataModelDisplayer>) createDataModelDisplayerAtIndex:(NSInteger)index forSection:(SCSection*)section;

@property (strong, nonatomic, readonly) NSMutableArray * sections;
@property (assign, nonatomic) BOOL showDebug;

@end
