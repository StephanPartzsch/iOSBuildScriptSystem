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
        NSLog(@"AAA %@: %@", NSStringFromSelector(_cmd), self);
        
        self.backgroundColor = [UIColor yellowColor];
        self.frame = [self getFrame];
        
        [self doSomething];
    }
    
    return self;
}

-(void) doSomething
{
    for (int i=0; i<50; i++) {
        NSLog(@"Iteration# %i", i);
    }
}

- (CGRect)getFrame
{
    NSString *string = [NSString string]; //@"HAllo unused";
    
    
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
