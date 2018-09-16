//
//  SXCalculatorUnit.h
//  ReuseCellPro
//
//  Created by Fly on 2018/9/16.
//  Copyright © 2018年 air. All rights reserved.
//

/**
*   1.函数式编程:
*   所谓的函数式编程就是当对象调用完一个函数之后，返回的还是这个对象本身，紧接着又可以继续调用此函数或者对象中定义的其他函数。
**/
/**
 * 2.链式编程 调用方法编程,
 *   1. 方法的返回值是block。
 *   2. 这个block必须有返回值，并且这个返回值就是对象本身；block也有输入参数。
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SXCalculatorUnit;

typedef SXCalculatorUnit *(^arit)(CGFloat num);

@interface SXCalculatorUnit : NSObject

@property (nonatomic, copy) arit additionArit;

@property (nonatomic, copy) arit subtractArit;

- (instancetype)initWithDecimalDigit:(CGFloat)num;

//返回相加后的结果
- (CGFloat)getResult;

//返回相加后的结果是否等于contrast YES相等 NO不相等
- (BOOL)equal:(BOOL (^)(CGFloat contrast))operation;

//链式编程
- (SXCalculatorUnit *(^)(CGFloat))add;

//函数式编程
- (SXCalculatorUnit *)addFun:(CGFloat)num;

@end
