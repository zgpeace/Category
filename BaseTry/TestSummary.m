//
//  TestSummary.m
//  CategorysControl
//
//  Created by cbz on 8/13/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import "TestSummary.h"
#import "NSArray-RandomObjects.h"

@implementation TestSummary

+ (void)randomArrayCategory
{
    NSArray *words = @[@"Curb",@"Days",@"Fins",@"Dish",@"Cite",@"Chat"];
    NSMutableArray *mutableWords = [words mutableCopy];
    for (int count = 0; count < [words count]; count++) {
        
        NSString *word = [words randomObjectWithArray:mutableWords];
        [mutableWords removeObjectsInArray:@[word]];
        NSLog(@"Next object is %@",word);
    }
    
}

@end
