//
//  CustomTabBarViewController.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/6/24.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "SimpleCustomTabBarViewController.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
#import "Demo3ViewController.h"
#import "Demo4ViewController.h"
#import "Demo5ViewController.h"
#import "SimpleCustomDemoViewController.h"

@interface SimpleCustomTabBarViewController ()<UITabBarControllerDelegate>

// 自定义的tabBarItem的下标
@property (nonatomic, assign) NSInteger customIndex;

@end

@implementation SimpleCustomTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.customIndex = 2;
    
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
    classControllers = @[@"Demo1ViewController", @"Demo2ViewController", @"Demo3ViewController", @"Demo4ViewController", @"Demo5ViewController"];
    NSArray *titles = @[@"首页", @"附近", @"", @"聊天", @"我的"];
    NSArray *normalImages = @[@"home_normal", @"mycity_normal", @"post_normal", @"message_normal", @"account_normal"];
    NSArray *selectImages = @[@"home_highlight", @"mycity_highlight", @"", @"message_highlight", @"account_highlight"];

    [self TabbarControllerAddSubViewsControllers:classControllers addTitleArray:titles addNormalImagesArray:normalImages addSelectImageArray:selectImages customIndex:self.customIndex];
}


# pragma mark - 初始化Tabbar里面的元素
- (void)TabbarControllerAddSubViewsControllers:(NSArray *)classControllersArray addTitleArray:(NSArray *)titleArray addNormalImagesArray:(NSArray *)normalImagesArray addSelectImageArray:(NSArray *)selectImageArray customIndex:(NSInteger)customIndex
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
        // 自定义运动tabBar的位置
        if (i == customIndex) {
            vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        }

    }

    self.viewControllers = conArr;
    self.tabBar.tintColor = [UIColor colorWithRed:255.0/255 green:204.0/255 blue:13.0/255 alpha:1];
    self.tabBar.translucent = NO;

    self.delegate = self;
}

# pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (viewController.tabBarItem.tag == self.customIndex) {
        
        /**
         definesPresentationContext这一属性决定了那个父控制器的View，
         将会以优先于UIModalPresentationCurrentContext这种呈现方式来展现自己的View。
         如果没有父控制器设置这一属性，那么展示的控制器将会是根视图控制器
         
         modalPresentationStyle可以设置模态是否隐藏
         
         */
        
        SimpleCustomDemoViewController *vc = [SimpleCustomDemoViewController new];
        self.definesPresentationContext = YES;
        vc.view.backgroundColor = [UIColor clearColor];
        vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self presentViewController:vc animated:YES completion:nil];
        return NO;
    }else{
        return YES;
    }
}


@end
