//
//  ViewController.m
//  JenkinsTest
//
//  Created by Stephan Partzsch on 11/05/15.
//  Copyright (c) 2015 Stephan Partzsch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"One more line here...");
    
    [self doOneThing:5];
    [self doTheSameThingAgain:3];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"...and one more here as well.");
}


- (int)doOneThing:(int)number {
    return number + number;
}

- (int)doTheSameThingAgain:(int)num {
    return num + num;
}

@end
