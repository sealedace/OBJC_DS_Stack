//
//  ViewController.m
//  StackDemo
//
//  Created by sealedace on 2019/5/9.
//  Copyright © 2019 sealedace. All rights reserved.
//

#import "ViewController.h"
#import "SA_DSStack.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SA_DSStack *testStack = [[SA_DSStack alloc] initWithSize:4];
    
    [testStack push:@"1"];
    [testStack push:@"2"];
    [testStack push:@"5"];
    
    id object = [testStack pop];
    NSLog(@"%@", object);
}


@end
