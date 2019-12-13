//
//  Demo8ViewController.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/12/13.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "Demo8ViewController.h"

@interface Demo8ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGFloat oldOffset;

@end

@implementation Demo8ViewController

- (NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}

//移除KVO、观察者
- (void)dealloc {
    [self removeObserver:self forKeyPath:@"isSliding" context:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    // 设置KVO、观察者
    [self addObserver:self forKeyPath:@"isSliding" options:NSKeyValueObservingOptionNew context:nil];
    
    for (int i = 0; i < 100; i++) {
        [self.array addObject:[NSNumber numberWithInt:i]];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}



# pragma mark - UITableViewDelegate,UITableViewDataSource

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.oldOffset = scrollView.contentOffset.y;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    // 向下
    if (scrollView.contentOffset.y > self.oldOffset)
    {
        // 对KVO、观察者发送信息
        [[NSNotificationCenter defaultCenter] postNotificationName:@"isSliding" object:@0];
    }
    // 向上
    else
    {
        // 对KVO、观察者发送信息
        [[NSNotificationCenter defaultCenter] postNotificationName:@"isSliding" object:@1];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [NSString stringWithFormat:@"No.%ld  (点击返回)",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
}


@end
