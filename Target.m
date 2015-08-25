//
//  Target.m
//  CategorysControl
//
//  Created by cbz on 8/20/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import "Target.h"

@implementation Target

- (id)init
{
    self = [super init];
    if (nil != self) {
        age = 10;
        self.name = @"John";
    }
    
    return self;
}

// for manual KVO - age
- (int)age
{
    return  age;
}

- (void)setAge:(int)theAge
{
    [self willChangeValueForKey:@"age"];
    age = theAge;
    [self didChangeValueForKey:@"age"];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
    if ([key isEqualToString:@"age"]) {
        return NO;
    }
    
    return [super automaticallyNotifiesObserversForKey:key];
}


@end



















