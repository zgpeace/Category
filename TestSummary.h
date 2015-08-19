//
//  TestSummary.h
//  CategorysControl
//
//  Created by cbz on 8/13/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestSummary : NSObject

+ (void)randomArrayCategory;

/** " * const"  **/
+ (void)starConst;

/** " const *"  **/
+ (void)constStar;

+ (void)blockDefinition;

+ (void)blockDirectUse;

+ (void)blockBlockPointer;

+ (void)myFuction:(int(^)(int))square;

+ (void)blockConstCopy;

+ (void)blockArrayCopy;

+ (void)blockStatic;

+ (void)blockStaticAlter;

+ (void)block__variable;

@end
