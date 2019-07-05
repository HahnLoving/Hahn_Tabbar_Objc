//
//  superViewController.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/7/5.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "SuperViewController.h"


@interface SuperViewController ()

@end

@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    //如果KVO、观察者有改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isAnimation:) name:@"isAnimation" object:nil];
}

// 得到监听值
- (void)isAnimation:(NSNotification *)notification{
    NSNumber *num = [notification object];
    if (num == @0) {
        self.tabBarController.tabBar.frame = CGRectMake(self.tabBarController.tabBar.frame.origin.x, self.tabBarController.tabBar.frame.origin.y + self.tabBarController.tabBar.frame.size.height, self.tabBarController.tabBar.frame.size.width, self.tabBarController.tabBar.frame.size.height);
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.tabBarController.tabBar.frame = CGRectMake(self.tabBarController.tabBar.frame.origin.x, self.tabBarController.tabBar.frame.origin.y - self.tabBarController.tabBar.frame.size.height, self.tabBarController.tabBar.frame.size.width, self.tabBarController.tabBar.frame.size.height);
        }];
    }
}
@end
