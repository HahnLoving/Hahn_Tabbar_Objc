//
//  SimpleCustomDemoViewController.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/6/27.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "SimpleCustomDemoViewController.h"

@interface SimpleCustomDemoViewController ()

@end

@implementation SimpleCustomDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *thisView = [[UIView alloc] initWithFrame:self.view.frame];
    thisView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5];
    [self.view addSubview:thisView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.center = self.view.center;
    [self.view addSubview:button];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIScreenEdgePanGestureRecognizer *edgeGes = [[UIScreenEdgePanGestureRecognizer alloc]  initWithTarget: self  action:@selector(backBtn)];
    edgeGes.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgeGes];


}

# pragma mark - 返回按钮
- (void)backBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
