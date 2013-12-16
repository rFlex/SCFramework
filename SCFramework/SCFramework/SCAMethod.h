//
//  SCAMethod.h
//  SCFramework
//
//  Created by Simon CORSIN on 14/11/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#define AMethod(...) SCAMethod *
#define Boxed(value) ((void*)(unsigned long int)value)

@interface SCAMethod : NSObject

- (id) initWithTarget:(id)target selector:(SEL)sel;

- (id) invoke:(void*)arg, ... NS_REQUIRES_NIL_TERMINATION;

+ (SCAMethod*) aMethodWithTarget:(id)target selector:(SEL)sel;

@end
