//
//  SXArithmeticUnit.m
//  ReuseCellPro
//
//  Created by Fly on 2018/9/16.
//  Copyright © 2018年 air. All rights reserved.
//

#import "SXArithmeticUnit.h"
@interface SXArithmeticUnit()

@property (nonatomic, assign) CGFloat result;
@end

@implementation SXArithmeticUnit

- (instancetype)initWithDecimalDigit:(CGFloat)num {
    self = [super init];
    if (self) {
        self.result = 0.0f;
        self.result = num;
        __weak SXArithmeticUnit *weakSelf = self;
        self.additionArit = ^SXArithmeticUnit *(CGFloat num) {
            __strong SXArithmeticUnit *strongSelf = weakSelf;
            strongSelf.result += num;
            return strongSelf;
        };
        
        self.subtractArit = ^SXArithmeticUnit *(CGFloat num) {
            __strong SXArithmeticUnit *strongSelf = weakSelf;
            strongSelf.result -= num;
            return strongSelf;
        };
    }
    return self;
}

- (CGFloat)getResult {
    return self.result;
}

@end
