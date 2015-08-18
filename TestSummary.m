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

/** " * const"  **/
+ (void)starConst
{
    char *str1 = {"Hello"};
    char *str2 = {"Hello World"};
    // 指针常量 －－ 指针本身是常量，指向的地址不可以变化，但是指向的地址所对应的内容可以变化
    char * const ptr1 = str1;
    
    // 编译错误 error C3892: 'ptr1': you cannot assign to a variable that is const
//    ptr1 = str2; //错误 因为这是一个常量指针，改变志向的地址了
    // 运行时错误 EXE_BAD_ACCESS
//    *ptr1 = 'A'; //正确 因为指向的地址的内容是可以变化的
    
    printf("%c \n", *ptr1);
}

/** " const *"  **/
+ (void)constStar
{
    char *str1 = {"Hello"};
    char *str2 = {"Hello World"};
    // 常量指针 －－ 指向字符串常量，所志向的字符串内容不能变，但是指向的地址可以变化
    const char *ptr1 = str1;
    
    ptr1 = str2; //正确 因为指向的地址是可以变化的
    // 错误 因为指向的地址是内容不可以变化的
//    *ptr1 = 'A';
    
    printf("%s \n", ptr1);
}


+ (void)blockDefinition
{
    ^{ printf("Hello, World!\n"); }();
    
    int a = 100;
    void (^block2)(void) = ^{
        printf("%d\n", a);
    };
    
    block2();
    
    __block int i = 1024;
    void (^block1)(void) = ^{
        printf("%d\n", i);
        i = 1023;
    };
    block1();
    
    printf("%d\n",i);
    
    
    __block int i3 = 1024;
    void (^block3)(NSString *) = ^(NSString *s){
        printf("%d\n", i3);
        printf("%s\n",s);
        NSLog(@"%@",s);
        i = 1023;
    } ;
    block3(@"abcd");
}

@end














