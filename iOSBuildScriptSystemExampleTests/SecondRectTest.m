#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SecondRect.h"


@interface SecondRectTest : XCTestCase

@end


@implementation SecondRectTest

- (void)testInitialization {
    
    SecondRect *rectangle = [SecondRect new];
    CGRect currentFrame = rectangle.frame;
    
    CGRect expectedFrame = CGRectMake(0, 0, 100, 100);
    
    XCTAssertTrue( CGRectEqualToRect(currentFrame, expectedFrame), @"Unexpected frame of SecondRect instance.");
}

- (void)testGetFrame3 {
    
    SecondRect *rectangle = [SecondRect new];
    CGRect currentFrame = [rectangle getFrame3];
    
    CGRect expectedFrame = CGRectMake(0, 0, 100, 100);

    XCTAssertTrue( CGRectEqualToRect(currentFrame, expectedFrame), @"Unexpected frame for getFrame3.");
}

- (void)testPerformanceOfGetFrame3 {
    
    SecondRect *rectangle = [SecondRect new];
    
    [self measureBlock:^{
        [rectangle getFrame3];
    }];
}

@end
