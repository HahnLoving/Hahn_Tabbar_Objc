//
//  ViewController.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/6/24.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "ViewController.h"
#import "TabBar/TabBarViewController.h"
#import "SimpleCustomTabBarViewController.h"
#import "CustomTabBar/CustomTabBarViewController.h"
#import "TaoBaoCustomTabBarViewController.h"
#import "AnimationTabBarViewController.h"
#import "JDAnimationTabBarViewController.h"
#import "SlidingViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

// tableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;
// 数据源
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation ViewController

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.dataArray addObject:@"普通的tabbar"];
    [self.dataArray addObject:@"简单加号按钮的tabbar"];
    [self.dataArray addObject:@"凸起来的加号按钮tabbar"];
    [self.dataArray addObject:@"淘宝按钮tabbar"];
    [self.dataArray addObject:@"动画音效按钮tabbar"];
    [self.dataArray addObject:@"京东起弹Tabbar"];
    [self.dataArray addObject:@"滑动隐藏Tabbar"];
    [self.dataArray addObject:@"自定义小红点Tabbar"];
}

# pragma mark - UITableViewDelegate 、UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 普通的tabbar
    if (indexPath.row == 0)
    {
        TabBarViewController *vc = [TabBarViewController new];
        vc.isBadge = NO;
        if (@available(iOS 13, *)) {
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
        }
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    // 简单加号按钮的tabbar
    else if (indexPath.row == 1)
    {
        
        SimpleCustomTabBarViewController *vc = [SimpleCustomTabBarViewController new];
        if (@available(iOS 13, *)) {
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
        }
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    // 凸起来的加号按钮tabbar
    else if (indexPath.row == 2)
    {
        CustomTabBarViewController *vc = [CustomTabBarViewController new];
        if (@available(iOS 13, *)) {
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
        }
        [self presentViewController:vc animated:YES completion:nil];
    }
    // 淘宝按钮tabbar
    else if (indexPath.row == 3)
    {
        
        TaoBaoCustomTabBarViewController *vc = [TaoBaoCustomTabBarViewController new];
        if (@available(iOS 13, *)) {
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
        }
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    // 动画按钮tabbar
    else if (indexPath.row == 4)
    {
        
        AnimationTabBarViewController *vc = [AnimationTabBarViewController new];
        if (@available(iOS 13, *)) {
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
        }
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    // 京东tabbar
    else if (indexPath.row == 5)
    {
        
        JDAnimationTabBarViewController *vc = [JDAnimationTabBarViewController new];
        if (@available(iOS 13, *)) {
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
        }
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    // 滑动隐藏Tabbar
    else if (indexPath.row == 6)
    {
        
        SlidingViewController *vc = [SlidingViewController new];
        if (@available(iOS 13, *)) {
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
        }
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    // 自定义小红点tabbar
    else if (indexPath.row == 7)
    {
        TabBarViewController *vc = [TabBarViewController new];
        vc.isBadge = YES;
        if (@available(iOS 13, *)) {
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
        }
        [self presentViewController:vc animated:YES completion:nil];
        
    }
}

@end
