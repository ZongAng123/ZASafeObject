//
//  ViewController.m
//  ZASafeObject
//
//  Created by 纵昂 on 2019/5/5.
//  Copyright © 2019 纵昂. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+SafeParse.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *parmars = @{@"name":@"jackyu",@"teacher":@{@"age":@"20"},@"students":@{@"name":@"zongang"}};
    
    NSLog(@"--------======%@",[parmars safeStringForKey:@"students|name"]);
}


@end
