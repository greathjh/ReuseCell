//
//  SXCalculatorUnit.m
//  ReuseCellPro
//
//  Created by Fly on 2018/9/16.
//  Copyright © 2018年 air. All rights reserved.
//

#import "SXCalculatorUnit.h"
@interface SXCalculatorUnit()

@property (nonatomic, assign) CGFloat result;
@end

@implementation SXCalculatorUnit

- (instancetype)initWithDecimalDigit:(CGFloat)num {
    self = [super init];
    if (self) {
        self.result = 0.0f;
        self.result = num;
        __weak SXCalculatorUnit *weakSelf = self;
        self.additionArit = ^SXCalculatorUnit *(CGFloat num) {
            __strong SXCalculatorUnit *strongSelf = weakSelf;
            strongSelf.result += num;
            return strongSelf;
        };
        
        self.subtractArit = ^SXCalculatorUnit *(CGFloat num) {
            __strong SXCalculatorUnit *strongSelf = weakSelf;
            strongSelf.result -= num;
            return strongSelf;
        };
    }
    return self;
}

- (CGFloat)getResult {
    return self.result;
}

- (BOOL)equal:(BOOL (^)(CGFloat))operation {
    return operation(self.result);
}


- (SXCalculatorUnit *(^)(CGFloat))add {
    return ^(CGFloat num){
        self.result += num;
        return self;
    };
}
@end
