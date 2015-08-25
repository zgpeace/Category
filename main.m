//
//  main.m
//  BaseTry
//
//  Created by cbz on 8/8/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray-RandomObjects.h"
#import "TestSummary.h"
#import "Observer.h"
#import "Target.h"
#import "TargetWrapper.h"
#import <objc/runtime.h>
#import "Foo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [TestSummary randomArrayCategory];
//        [TestSummary starConst];
//        [TestSummary constStar];
//        [TestSummary blockDefinition];
//        [TestSummary blockDirectUse];
//        [TestSummary blockBlockPointer];
//        [TestSummary blockConstCopy];
//        [TestSummary blockArrayCopy];
//        [TestSummary blockStatic];
//        [TestSummary blockStaticAlter];
//        [TestSummary block__variable];
//        [TestSummary kvoBasic];
//        [TestSummary kvoDependency];
        
        // Deep into KVO: kesalin@gmail.com
        
        Foo *anything = [[Foo alloc] init];
        Foo *x = [[Foo alloc] init];
        Foo *y = [[Foo alloc] init];
        Foo *xy = [[Foo alloc] init];
        Foo *control = [[Foo alloc] init];
        
        [x addObserver:anything forKeyPath:@"x" options:0 context:NULL];
        [y addObserver:anything forKeyPath:@"y" options:0 context:NULL];
        [xy addObserver:anything forKeyPath:@"x" options:0 context:NULL];
        [xy addObserver:anything forKeyPath:@"y" options:0 context:NULL];
        
        PrintDescription(@"control", control);
        PrintDescription(@"x", x);
        PrintDescription(@"y", y);
        PrintDescription(@"xy", xy);
        
        NSLog(@"\n\t Using NSObject methos, normal setX: is %p, overridden set X: is %p\n", [control methodForSelector:@selector(setX:)], [x methodForSelector:@selector(setX:)]);
        
        NSLog(@"\n\tUsing libobjc functions, normal setX: is %p, overridden setX: is %p\n", method_getImplementation(class_getInstanceMethod(object_getClass(control), @selector(setX:))), method_getImplementation(class_getInstanceMethod(object_getClass(x), @selector(setX:))));
    
        
        
    }
    
    return 0;
}

static NSArray * ClassMethodNames(Class c)
{
    NSMutableArray *array = [NSMutableArray array];
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(c, &methodCount);
    unsigned int i;
    for (i = 0; i < methodCount; i++) {
        [array addObject:NSStringFromSelector(method_getName(methodList[i]))];
    }
    
    free(methodList);
    
    return array;
}

static void printDescription(NSString *name, id obj)
{
//    NSString *str = [NSString stringWithFormat:@"\n\t%@: %@\n\tNSObject class %s\n\tlibobjc class %s \n\t implements methods <%@>", name, obj, class_getName([obj class]), class_getName(obj -> isa), [ClassMethodNames(obj -> isa) componentsJoinedByString:@","]];
//    
//    NSLog(@"%@", str);
}











