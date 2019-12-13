//
//  SlidingViewController.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/12/13.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "SlidingViewController.h"
#import "Demo8ViewController.h"
#import "Demo2ViewController.h"
#import "Demo3ViewController.h"
#import "Demo4ViewController.h"
#import "Demo5ViewController.h"

@interface SlidingViewController ()

@end

@implementation SlidingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self tabBarControllerAddChildViewController];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

# pragma mark - 添加子类的数据
- (void)tabBarControllerAddChildViewController
{
    NSArray *classControllers = [NSArray array];
    classControllers = @[@"Demo8ViewController", @"Demo2ViewController", @"Demo3ViewController", @"Demo4ViewController", @"Demo5ViewController"];
    NSArray *titles = @[@"首页1", @"附近", @"是的", @"聊天", @"我的"];
    NSArray *normalImages = @[@"home_normal", @"mycity_normal", @"mycity_normal", @"message_normal", @"account_normal"];
    NSArray *selectImages = @[@"home_highlight", @"mycity_highlight", @"mycity_highlight", @"message_highlight", @"account_highlight"];
    
    [self TabbarControllerAddSubViewsControllers:classControllers addTitleArray:titles addNormalImagesArray:normalImages addSelectImageArray:selectImages];
}


# pragma mark - 初始化Tabbar里面的元素
- (void)TabbarControllerAddSubViewsControllers:(NSArray *)classControllersArray addTitleArray:(NSArray *)titleArray addNormalImagesArray:(NSArray *)normalImagesArray addSelectImageArray:(NSArray *)selectImageArray
{
    NSMutableArray *conArr = [NSMutableArray array];
    
    for (int i = 0; i < classControllersArray.count; i++) {
        
        Class cts = NSClassFromString(classControllersArray[i]);
        UIViewController *vc = [[cts alloc] init];
        UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:vc];
        [conArr addObject:naVC];
        
        UIImage *normalImage = [[UIImage imageNamed:normalImagesArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectImage = [[UIImage imageNamed:selectImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titleArray[i] image:normalImage selectedImage:selectImage];
        vc.tabBarItem.tag = i;
    }
    
    self.viewControllers = conArr;
    self.tabBar.tintColor = [UIColor colorWithRed:255.0/255 green:204.0/255 blue:13.0/255 alpha:1];
    self.tabBar.translucent = NO;
}

@end
