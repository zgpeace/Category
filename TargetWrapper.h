//
//  TargetWrapper.h
//  CategorysControl
//
//  Created by cbz on 8/21/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Target.h"

@interface TargetWrapper : NSObject
{
    @private Target *target;
}

@property (nonatomic, weak) NSString *information;
@property (nonatomic, strong) Target *target;

- (id)init:(Target *)aTarget;

@end
