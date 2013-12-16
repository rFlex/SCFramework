//
//  SCListDataDisplayerHandlerInternal.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/20/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCListDataDisplayerHandler.h"

@interface SCListDataDisplayerHandler() {
    
}

- (SCSection*) createSection;

@property (strong, nonatomic) NSMutableArray * sections;

@end
