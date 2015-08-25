//
//  TargetWrapper.m
//  CategorysControl
//
//  Created by cbz on 8/21/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import "TargetWrapper.h"

@implementation TargetWrapper

- (id)init:(Target *)aTarget
{
    self = [super init];
    if (nil != self) {
        _target = aTarget;
    }
    
    return self;
}

- (void)dealloc
{
    self.target = nil;
}

- (NSString *)information
{
    @autoreleasepool {
        return [[NSString alloc] initWithFormat:@"%d#%d",[self.target grade], [self.target age]];
    }
    
}

- (void)setInformation:(NSString *)information
{
    NSArray *array = [information componentsSeparatedByString:@"#"];
    [self.target setGrade:[[array objectAtIndex:0] intValue]];
    [_target setAge:[[array objectAtIndex:1] intValue]];
}

+ (NSSet *)keyPathsForValuesAffectingInformation
{
    NSSet *keyPaths = [NSSet setWithObjects:@"target.age", @"target.grade", nil];
    
    return keyPaths;
}


/*
///实现 keyPathsForValuesAffectingValueForKey，要先获取 super 返回的结果 set，然后判断 key 是不是目标 key，如果是就将依赖属性的 key-path 结合追加到 super 返回的结果 set 中，否则直接返回 super的结果。
+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    NSArray *moreKeyPaths = nil;
    
    if ([key isEqualToString:@"information"]) {
        moreKeyPaths = [NSArray arrayWithObjects:@"target.age", @"target.grade", nil];
    }
    
    if (moreKeyPaths) {
        keyPaths = [keyPaths setByAddingObjectsFromArray:moreKeyPaths];
    }
    
    return keyPaths;
}
 */



@end












