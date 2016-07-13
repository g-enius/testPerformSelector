//
//  ViewController.m
//  testPerformSelector
//
//  Created by Charles on 7/13/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#define type 6

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    
    SEL sel = @selector(print);
    
#if type == 0
    [self performSelector:sel];

#elif type == 1
    [self performSelector:sel withObject:nil];

#elif type == 2
    [self performSelector:sel withObject:nil afterDelay:0.0];

#elif type == 3
    [self performSelectorOnMainThread:sel withObject:nil waitUntilDone:NO];

#elif type == 4
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self print];
    });
    
#elif type == 5
    dispatch_async(dispatch_get_main_queue(), ^{
        [self print];
    });
    
#elif type == 6
//进程死锁
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self print];
    });

#endif
}

- (void)print
{
    NSLog(@"++++++++ type %d +++++++++", type);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

@end
