//
//  Demo1ViewController.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/6/24.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "Demo1ViewController.h"

@interface Demo1ViewController ()

@end

@implementation Demo1ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

# pragma mark - 返回按钮
- (void)backBtn
{
    [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
}


@end
