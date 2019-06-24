//
//  CustomTabBarViewController.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/6/24.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
#import "Demo3ViewController.h"
#import "Demo4ViewController.h"
#import "Demo5ViewController.h"

@interface CustomTabBarViewController ()

@end

@implementation CustomTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSubViewsControllers];
    [self customTabbarItem];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

# pragma mark - 初始化TabBar里面的控制权
-(void)addSubViewsControllers
{
    NSArray *classControllers = [NSArray array];
    classControllers = @[@"Demo1ViewController", @"Demo2ViewController", @"Demo3ViewController", @"Demo4ViewController", @"Demo5ViewController"];
    NSMutableArray *conArr = [NSMutableArray array];
    for (int i = 0; i < classControllers.count; i ++) {
        Class cts = NSClassFromString(classControllers[i]);
        UIViewController *vc = [[cts alloc] init];
        UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:vc];
        [conArr addObject:naVC];
    }
    self.viewControllers = conArr;
}

# pragma mark - 初始化TabBar里面的图标和文字
-(void)customTabbarItem
{
    NSArray *titles = @[@"首页", @"附近", @"发布", @"聊天", @"我的"];
    NSArray *normalImages = @[@"home_normal", @"mycity_normal", @"mycity_normal", @"message_normal", @"account_normal"];
    NSArray *selectImages = @[@"home_highlight", @"mycity_highlight", @"mycity_normal", @"message_highlight", @"account_highlight"];
    
    for (int i = 0; i < titles.count; i++) {
        UIViewController *vc = self.viewControllers[i];
        UIImage *normalImage = [[UIImage imageNamed:normalImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectImage = [[UIImage imageNamed:selectImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:normalImage selectedImage:selectImage];
    }
    
    self.tabBar.tintColor = [UIColor colorWithRed:255.0/255 green:204.0/255 blue:13.0/255 alpha:1];
    self.tabBar.translucent = NO;
}
@end
