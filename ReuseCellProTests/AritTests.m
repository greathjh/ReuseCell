//
//  AritTests.m
//  ReuseCellProTests
//
//  Created by Fly on 2018/9/16.
//  Copyright © 2018年 air. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SXCalculatorUnit.h"

@interface AritTests : XCTestCase

@end

@implementation AritTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testAritAdd {
    CGFloat res = [[SXCalculatorUnit alloc] initWithDecimalDigit:1.0].additionArit(2).getResult;
    NSLog(@"%lf", res);
}

- (void)testAritAdd1 {
    CGFloat res = [[SXCalculatorUnit alloc] initWithDecimalDigit:2.0].add(2).getResult;
    NSLog(@"%lf", res);
}

- (void)testEquip {
    BOOL res = [[[SXCalculatorUnit alloc] initWithDecimalDigit:1.3].additionArit(3.2) equal:^BOOL(CGFloat contrast) {
        return contrast == 4.5;
    }];
    NSLog(@"%ld", res);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
