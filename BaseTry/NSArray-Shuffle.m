//
//  NSArray-Shuffle.m
//  CategorysControl
//
//  Created by cbz on 8/8/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import "NSArray-Shuffle.h"

@implementation NSArray (Shuffle)

- (NSArray *)shuffledArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSMutableArray *copy = [self mutableCopy];
    
    while ([copy count] > 0) {
        int index = arc4random() % [copy count];
        id objcetToMove = [copy objectAtIndex:index];
        [array addObject:objcetToMove];
        [copy removeObjectAtIndex:index];
    }
    
    return array;

}











@end

