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

+ (void)blockDirectUse
{
    int result = ^(int a){return a*a;}(5);
    NSLog(@"%d", result);
}

+ (void)blockBlockPointer
{
    //declare one square for Block Pointer, 使其指向的Block有一个int输入和int输出
    int (^square)(int);
    //将Block实体指定给square
    square = ^(int a){return a*a; };
    //调用方法， 感觉是不是很像function的用法？
    int result = square(5);
    NSLog(@"%d", result);
}

+ (void)blockFuction
{

//    void myFunction(int (^mySquare)(int)); // function defination , Block as parameter
//
//    int (^mySquare)(int) = ^(int a){return a*a; }; //define a mySquare with Block pointer variable

    
}



+ (void)myFuction:(int(^)(int))square
{
    NSLog(@"%@", square);
}

+ (void)blockConstCopy
{
    int outA = 8;
    //block 里面可以读取同一类型的outA的值
    int (^myPtr)(int) = ^(int a){ return outA + a;};
    outA = 5; //在调用myPtr之前改变outA的值
    int result = myPtr(3); // result is 11
    NSLog(@"result=%d", result);
}

+ (void)blockArrayCopy
{
    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@"one", @"two", @"three", nil];
    int result1 = ^(int a){[mutableArray removeLastObject]; return a*a;}(5);
    NSLog(@"test array : %@", mutableArray);
    NSLog(@"%d",result1);
}

+ (void)blockStatic
{
    static int outA = 8;
    int (^myPtr)(int) = ^(int a){return outA + a;};
    outA = 5;
    int result = myPtr(3); //result = 8
    NSLog(@"result=%d", result);
}

+ (void)blockStaticAlter
{
    static int outA = 8;
    int (^myPtr)(int) = ^(int a){ outA = 5; return outA + a; };
    int result = myPtr(3); // result = 8;
    NSLog(@"result = %d", result);
}

+ (void)block__variable
{
    __block int num = 5;
    
    int (^myPtr)(int) = ^(int a){return num++;};
    int (^myPtr2)(int) = ^(int a){return num++;};
    int result = myPtr(0);  // result = 5, num = 6;
    NSLog(@"result = %d", result);
    result = myPtr2(0);  // result = 6, num =7;
    NSLog(@"result = %d", result);
}

@end














