//
//  Demo7ViewController.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/7/6.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "Demo7ViewController.h"
#import "Demo6ViewController.h"

@interface Demo7ViewController ()

@end

@implementation Demo7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 200, 200)];
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(pushBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}

# pragma mark - 返回按钮
- (void)backBtn
{
    [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
}

# pragma mark - push
- (void)pushBtn
{
    Demo6ViewController *vc = [[Demo6ViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
