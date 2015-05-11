//
//  JenkinsTestTests.m
//  JenkinsTestTests
//
//  Created by Stephan Partzsch on 11/05/15.
//  Copyright (c) 2015 Stephan Partzsch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface JenkinsTestTests : XCTestCase

@end

@implementation JenkinsTestTests

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
    XCTAssert(YES, @"Pass");
}


- (void)testMath {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    XCTAssertEqual(11, 5+5);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
