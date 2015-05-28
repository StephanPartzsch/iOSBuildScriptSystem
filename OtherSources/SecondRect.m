//
//  SecondRect.m
//  JenkinsTest
//
//  Created by Stephan Partzsch on 28/05/15.
//  Copyright (c) 2015 Stephan Partzsch. All rights reserved.
//

#import "SecondRect.h"

@implementation SecondRect

- (instancetype) init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        self.frame = [self getFrame];
    }
    
    return self;
}

- (CGRect)getFrame
{
   int number = 3;
   return CGRectMake(0, 0, 100, 100);
}

- (CGRect)getFrame3
{
    int number = 3;
    return CGRectMake(0, 0, 100, 100);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
