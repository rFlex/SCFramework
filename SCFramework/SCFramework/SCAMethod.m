//
//  SCAMethod.m
//  SCFramework
//
//  Created by Simon CORSIN on 14/11/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "SCAMethod.h"

@interface SCAMethod()

@property (strong, nonatomic) NSInvocation * invocation;

@end

@implementation SCAMethod

- (id) initWithTarget:(id)theTarget selector:(SEL)sel {
	self = [self init];
	
	if (self) {
		self.invocation = [NSInvocation invocationWithMethodSignature:[theTarget methodSignatureForSelector:sel]];
		NSLog(@"BaseTarget: %@", theTarget);
		self.invocation.target = theTarget;
		self.invocation.selector = sel;
	}
	
	return self;
}

- (void) setArgument:(void*)argument atIndex:(NSUInteger)index {
	void * null = (__bridge void*)[NSNull null];
	
	if (argument == null) {
		argument = nil;
	}
	
	[self.invocation setArgument:&argument atIndex:index + 2];
}

- (id) invoke:(void*)param1, ... {
	NSUInteger currentArg = 0;
	if (param1 != nil) {
		
		[self setArgument:param1 atIndex:currentArg];
		currentArg++;
		
		va_list list;
		va_start(list, param1);
		
		void * newObject = nil;
		
		while ((newObject = va_arg(list, void*))) {
			[self setArgument:newObject atIndex:currentArg];
			currentArg++;
		}
		
		va_end(list);
	}
	

	NSLog(@"Target: %p", self.invocation.target );
	[self.invocation invoke];
	
	id retValue = nil;
	
//	[self.invocation getReturnValue:&retValue];
	
	return retValue;
}

+ (SCAMethod*) aMethodWithTarget:(id)target selector:(SEL)sel {
	return [[SCAMethod alloc] initWithTarget:target selector:sel];
}

@end
