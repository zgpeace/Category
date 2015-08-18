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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [TestSummary randomArrayCategory];
//        [TestSummary starConst];
//        [TestSummary constStar];
//        [TestSummary blockDefinition];
        
        //串行队列
        dispatch_queue_t serialQueue = dispatch_queue_create("com.gcd.serialQueue", DISPATCH_QUEUE_SERIAL);
        //并发队列
        dispatch_queue_t concurrentQueue = dispatch_queue_create("com.gcd.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
        
        dispatch_async(concurrentQueue, ^{
            NSLog(@"1");
        });
        dispatch_async(concurrentQueue, ^{
            NSLog(@"2");
        });
        dispatch_async(concurrentQueue, ^{
            NSLog(@"3");
        });
        dispatch_async(concurrentQueue, ^{
            NSLog(@"4");
        });
        
        dispatch_async(serialQueue, ^{
            NSLog(@"4");
            dispatch_sync(concurrentQueue, ^{
                [NSThread sleepForTimeInterval:3];
                NSLog(@"5");
            });
            NSLog(@"6");
        });
        
    }
    return 0;
}


