//
//  SYTConditionBaseEntity.m
//  SYTConditionFilterView
//
//  Created by Eden on 26/5/19.
//  Copyright © 2019年 Eden. All rights reserved.
//

#import "SYTConditionBaseEntity.h"

@implementation SYTConditionBaseEntity

- (instancetype)init {
    if (self = [super init]) {
        
        self.normalFont = [UIFont systemFontOfSize:15];
        self.selectedFont = [UIFont systemFontOfSize:15];
        
        self.normalColor = [UIColor blackColor];
        self.selectedColor = [UIColor redColor];
        
        self.titleImageMargin = 4;
    }
    return self;
}

@end

@implementation SYTConditionNormal

@end

@implementation SYTConditionArrow

@end

@implementation SYTConditionImage

@end

