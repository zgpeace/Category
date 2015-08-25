//
//  Target.h
//  CategorysControl
//
//  Created by cbz on 8/20/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Target : NSObject
{
    int age;
}

// for manual KVO - age

- (int)age;

- (void)setAge:(int)theAge;

@property (nonatomic, readwrite) NSString *name;

@property (nonatomic, readwrite) int grade;

@end
