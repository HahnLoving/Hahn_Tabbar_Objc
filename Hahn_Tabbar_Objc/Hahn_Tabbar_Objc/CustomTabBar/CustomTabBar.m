//
//  CustomTabBar.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/6/28.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "CustomTabBar.h"

@interface CustomTabBar ()

@end

@implementation CustomTabBar

# pragma mark - 赖加载
- (UIButton *)plusButton
{
    if (_plusButton == nil) {
        _plusButton = [[UIButton alloc] init];
        [_plusButton setImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
        [_plusButton setImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateHighlighted];
       
        _plusButton.titleLabel.font = [UIFont systemFontOfSize:11];
        [_plusButton setTitle:@"发布" forState:UIControlStateNormal];
        [_plusButton setTitle:@"发布" forState:UIControlStateHighlighted];
        [_plusButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//        [_plusButton setTitleColor:[UIColor colorWithRed:255.0/255 green:204.0/255 blue:13.0/255 alpha:1] forState:UIControlStateSelected];
       
        UIImage *buttonImg = [_plusButton imageForState:UIControlStateNormal];
        CGFloat titleWidth = [_plusButton.titleLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:11],NSFontAttributeName, nil]].width;
        [_plusButton setTitleEdgeInsets:UIEdgeInsetsMake(buttonImg.size.height, -buttonImg.size.width, -15, 0)];
        [_plusButton setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, -titleWidth)];
        
        _plusButton.frame = CGRectMake(0, 0, _plusButton.imageView.image.size.width, _plusButton.imageView.image.size.height + 40);
        [_plusButton addTarget:self action:@selector(respondsToPlusButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _plusButton;
}

# pragma mark - CustomTabBarDelegate
- (void)respondsToPlusButton
{
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.myDelegate tabBarDidClickPlusButton:self];
    }
}

# pragma mark - 添加按钮
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.plusButton];
    }
    return self;
}

# pragma mark - 重新布局
- (void)layoutSubviews
{
    [super layoutSubviews];
   
   NSMutableDictionary *dict = [NSMutableDictionary dictionary];
   [dict setValue:@"hzl" forKey:@"name"];
   self.block(dict);
   
    // 设置中间按钮的位置
    self.plusButton.center = CGPointMake(CGRectGetWidth(self.frame) * 0.5, CGRectGetHeight(self.frame) * 0.1);
    
    // 设置其他的按钮的位置
//    CGFloat w = CGRectGetWidth(self.frame) / 5;
    CGFloat w = CGRectGetWidth(self.frame) / 3;
    CGFloat index = 0;
    for (UIView *childView in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([childView isKindOfClass:class]) {
            childView.frame = CGRectMake(w * index, CGRectGetMinY(childView.frame), w, CGRectGetHeight(childView.frame));
            
            // 增加索引 要和中间的控件隔开
            index ++;
//            if (index == 2) {
//                index ++;
//            }
           
           if (index == 1) {
               index ++;
           }

            
        }
    }
}


# pragma mark - 重写hitTest方法以响应点击超出tabBar的加号按钮
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.clipsToBounds && !self.hidden && self.alpha > 0) {
        UIView *result = [super hitTest:point withEvent:event];
        if (result) {
            return result;
        }
        else {
            for (UIView *subview in self.subviews.reverseObjectEnumerator) {
                CGPoint subPoint = [subview convertPoint:point fromView:self];
                result = [subview hitTest:subPoint withEvent:event];
                if (result) {
                    return result;
                }
            }
        }
    }
    return nil;
}


@end
