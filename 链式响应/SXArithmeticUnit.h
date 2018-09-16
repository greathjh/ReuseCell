//
//  SXArithmeticUnit.h
//  ReuseCellPro
//
//  Created by Fly on 2018/9/16.
//  Copyright © 2018年 air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SXArithmeticUnit;

typedef SXArithmeticUnit *(^arit)(CGFloat num);

@interface SXArithmeticUnit : NSObject

@property (nonatomic, copy) arit additionArit;

@property (nonatomic, copy) arit subtractArit;

- (instancetype)initWithDecimalDigit:(CGFloat)num;

- (CGFloat)getResult;

@end
