//
//  ViewController.m
//  JenkinsTest
//
//  Created by Stephan Partzsch on 11/05/15.
//  Copyright (c) 2015 Stephan Partzsch. All rights reserved.
//

#import "ViewController.h"
#import "SecondRect.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"One more line here...");
    
    [self doOneThing:5];
    [self doTheSameThingAgain:3];
    [self drawColoredRectangle];
    [self addSecondRectangle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"...and one more here as well.");
}

- (void)drawColoredRectangle {
    
    UIColor *color = [UIColor blueColor];
    
#if COLOR_RED
    color = [UIColor redColor];
#endif
    
    CGRect rectangleFrame = CGRectMake((self.view.bounds.size.width-150)/2, (self.view.bounds.size.height-150)/2, 150, 150);
    UIView *rectangle = [[UIView alloc] initWithFrame:rectangleFrame];
    rectangle.backgroundColor = color;
    
#if OUTLINE
    rectangle.layer.borderColor = [UIColor grayColor].CGColor;
    rectangle.layer.borderWidth = 3.0f;
#endif
    
    [self.view addSubview:rectangle];
}

- (void)addSecondRectangle {
    [self.view addSubview:[SecondRect new]];
}

- (int)doOneThing:(int)number {
    int result = 20;
    result = number * 5 / (number * 0.5);
    return result + number;
}

- (int)doTheSameThingAgain:(int)number {
    int result = 20;
    result = number * 5 / (number * 0.5);
    return result + number;
}

- (void)noCall:(int)num {
    int result = 0;
    num * num;
}

@end
