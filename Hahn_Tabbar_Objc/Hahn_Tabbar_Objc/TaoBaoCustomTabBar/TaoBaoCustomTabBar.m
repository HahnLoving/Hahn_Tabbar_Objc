//
//  CustomTabBar.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/6/28.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "TaoBaoCustomTabBar.h"

@interface TaoBaoCustomTabBar ()

@end

@implementation TaoBaoCustomTabBar

# pragma mark - 赖加载
- (UIButton *)plusButton
{
    if (_plusButton == nil) {
        _plusButton = [[UIButton alloc] init];
        [_plusButton setImage:[UIImage imageNamed:@"taobao"] forState:UIControlStateNormal];
        [_plusButton setImage:[UIImage imageNamed:@"taobao"] forState:UIControlStateHighlighted];
        
        _plusButton.frame = CGRectMake(0, 0, _plusButton.imageView.image.size.width + 1, _plusButton.imageView.image.size.height + 1);
        [_plusButton addTarget:self action:@selector(respondsToPlusButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _plusButton;
}

# pragma mark - TaoBaoCustomTabBarDelegate
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

    // 设置淘宝按钮的位置
    CGFloat w = CGRectGetWidth(self.frame) / 5;
    CGFloat index = 0;
    for (UIView *childView in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([childView isKindOfClass:class]) {
            if (index == 0) {
                UIView *thisView = [[UIView alloc] initWithFrame:CGRectMake(w * index, CGRectGetMinY(childView.frame), w, CGRectGetHeight(childView.frame))];
                self.plusButton.center = CGPointMake(CGRectGetWidth(thisView.frame) * 0.5, CGRectGetHeight(thisView.frame) * 0.5);
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
