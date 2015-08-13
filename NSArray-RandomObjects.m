//
//  NSArray-RandomObjects.m
//  CategorysControl
//
//  Created by cbz on 8/8/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import "NSArray-RandomObjects.h"
#import "NSArray-Shuffle.h"

@implementation NSArray (RandomObjects)

// You could also pass in an array as an argument
- (id)randomObjectWithArray:(NSArray *)retainArray
{
    NSMutableArray *randomArray = [[retainArray shuffledArray] mutableCopy];
    NSInteger index = arc4random() % [randomArray count];
    id object = [randomArray objectAtIndex:index];
//    [randomArray removeObjectAtIndex:index];
    return object;
}

@end

