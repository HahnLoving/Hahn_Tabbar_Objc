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
        [self presentViewController:[TabBarViewController new] animated:YES completion:nil];
    }
    // 系统自定义的tabbar
    else if (indexPath.row == 1)
    {
        [self presentViewController:[SimpleCustomTabBarViewController new] animated:YES completion:nil];
    }
    // 自定义的tabbar
    else if (indexPath.row == 2)
    {
        [self presentViewController:[CustomTabBarViewController new] animated:YES completion:nil];
    }
}

@end
