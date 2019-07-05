//
//  Demo6ViewController.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/7/5.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "Demo6ViewController.h"

@interface Demo6ViewController ()

@end

@implementation Demo6ViewController

//移除KVO、观察者
- (void)dealloc {
    [self removeObserver:self forKeyPath:@"isAnimation" context:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    // 设置KVO、观察者
    [self addObserver:self forKeyPath:@"isAnimation" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 对KVO、观察者发送信息
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isAnimation" object:@0];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    // 对KVO、观察者发送信息
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isAnimation" object:@1];
}

@end
