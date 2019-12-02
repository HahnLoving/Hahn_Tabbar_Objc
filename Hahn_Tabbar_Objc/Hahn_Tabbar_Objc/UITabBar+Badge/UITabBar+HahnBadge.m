//
//  UITabBar+HahnBadge.m
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/12/2.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import "UITabBar+HahnBadge.h"
#import <objc/runtime.h>

// tabbar tag
#define badgeTag(index) (1000 + index)

/**
 运行时对应的key值
 */
static char *kBadgeSize = "kBadgeSize";
static char *kBadgeColor = "kBadgeColor";
static char *kBadgeImage = "kBadgeImage";
static char *kBadgePoint = "kBadgePoint";
static char *kBadgeValue = "kBadgeValue";

@implementation UITabBar (HahnBadge)

/**
 运行时注释
 objc_setAssociatedObject 相当于 setValue:forKey 进行关联value对象

 objc_getAssociatedObject 用来读取对象

 objc_AssociationPolicy  属性 是设定该value在object内的属性，即 assgin, (retain,nonatomic)...等

  objc_removeAssociatedObjects 函数来移除一个关联对象，或者使用objc_setAssociatedObject函数将key指定的关联对象设置为nil。
 
 key：要保证全局唯一，key与关联的对象是一一对应关系。必须全局唯一。通常用@selector(methodName)作为key。
 value：要关联的对象。
 policy：关联策略。有五种关联策略。
 OBJC_ASSOCIATION_ASSIGN 等价于 @property(assign)。
 OBJC_ASSOCIATION_RETAIN_NONATOMIC等价于 @property(strong, nonatomic)。
 OBJC_ASSOCIATION_COPY_NONATOMIC等价于@property(copy, nonatomic)。
 OBJC_ASSOCIATION_RETAIN等价于@property(strong,atomic)。
 OBJC_ASSOCIATION_COPY等价于@property(copy, atomic)。
 
 */

// 运行时处理分类属性
- (void)setBadgeSize:(CGSize)badgeSize
{
    objc_setAssociatedObject(self, &kBadgeSize,[NSValue valueWithCGSize:badgeSize], OBJC_ASSOCIATION_ASSIGN);
 }

- (CGSize)badgeSize
{
   return [objc_getAssociatedObject(self, &kBadgeSize) CGSizeValue];

}

- (void)setBadgeImage:(UIImage *)badgeImage
{
    objc_setAssociatedObject(self, &kBadgeImage, badgeImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (UIImage *)badgeImage
{
    return objc_getAssociatedObject(self, &kBadgeImage);

}

- (void)setBadgeColor:(UIColor *)badgeColor
{
    objc_setAssociatedObject(self, &kBadgeColor, badgeColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (UIColor *)badgeColor
{
    return objc_getAssociatedObject(self, &kBadgeColor);
}


- (void)setBadgePoint:(CGPoint)badgePoint
{
    objc_setAssociatedObject(self, &kBadgePoint, [NSValue valueWithCGPoint:badgePoint], OBJC_ASSOCIATION_ASSIGN);
}

- (CGPoint)badgePoint
{
//    objc_getAssociatedObject(self, &kBadgePoint);
    return [objc_getAssociatedObject(self, &kBadgePoint) CGPointValue];
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    objc_setAssociatedObject(self, &kBadgeValue, badgeValue, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)badgeValue
{
    return objc_getAssociatedObject(self, &kBadgeValue);
}

// 显示小红点
- (void)showBadgeOnItemIndex:(NSUInteger )index
{
    // 移除
    [self removeRedPointOnIndex:index animation:NO];
    
    // 小红点背景默认值大小设置
    if (CGSizeEqualToSize(self.badgeSize, CGSizeZero))
    {
        self.badgeSize = CGSizeMake(12, 12);
    }
    // 小红点背景默认值颜色设置
    if (!self.badgeColor)
    {
        self.badgeColor = [UIColor redColor];
    }
    
    // badgeView(小红点)
    UIView *badgeView = [[UIView alloc]init];
    badgeView.backgroundColor = self.badgeColor;
    badgeView.layer.cornerRadius = self.badgeSize.width / 2;
    badgeView.tag = badgeTag(index);
    
    // barButtonView(里面包含文字和图片)
    UIView *barButtonView = [self getBarButttonViewWithIndex:index];
    //（图片的imageView）
    UIView *iconView = nil;
    for (UIView *swappableImageView  in barButtonView.subviews)
    {
        if ([swappableImageView isKindOfClass:[UIImageView class]])
        {
            iconView = swappableImageView;
            break;
        }
    }
    
    // 小红点背景默认值Point设置
    if (CGPointEqualToPoint(self.badgePoint, CGPointZero))
    {
        CGSize iconViewSize = iconView.frame.size;
        badgeView.frame = CGRectMake(iconViewSize.width - self.badgeSize.width / 2, - self.badgeSize.width / 2, self.badgeSize.width, self.badgeSize.height);
    }else{
        badgeView.frame = CGRectMake(self.badgePoint.x, self.badgePoint.y, self.badgeSize.width, self.badgeSize.height);
    }
    
    // 添加图片到小红点上
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:badgeView.bounds];
    imageview.image = self.badgeImage;
    if (self.badgeImage)
    {
        self.badgeColor = [UIColor clearColor];
    }
    [badgeView addSubview:imageview];
    
    if (self.badgeValue) {
        UILabel *badgeValue = [[UILabel alloc] initWithFrame:badgeView.bounds];
        badgeValue.text = self.badgeValue;
        badgeValue.textAlignment = NSTextAlignmentCenter;
        badgeValue.font = [UIFont systemFontOfSize:13];
        badgeValue.textColor = [UIColor whiteColor];
        [badgeView addSubview:badgeValue];
    }
    //添加小红点到系统图层上
    [iconView addSubview:badgeView];
    
    
 }

//隐藏小红点
- (void)hiddenRedPointOnIndex:(NSUInteger )index animation:(BOOL )animation
{
    [self removeRedPointOnIndex:index animation:animation];
    
}

- (void)removeRedPointOnIndex:(NSUInteger )index animation:(BOOL )animation
{
    // 获取对应的barButtonView（里面包含文字和图片）
    UIView *barButtonView = [self getBarButttonViewWithIndex:index];
    for (UIView *swapView in barButtonView.subviews)
    {
        if ([swapView isKindOfClass:[UIImageView class]])       //遍历出图片类的uiview图层_iconView
        {
            for (UIView *view in swapView.subviews)
            {
                if (view.tag == badgeTag(index))                //找到了小红点
                {
                    if (animation)
                    {
                        [UIView animateWithDuration:0.2 animations:^{
                            view.transform = CGAffineTransformScale(view.transform, 2, 2);
                            view.alpha = 0;
                            
                        } completion:^(BOOL finished) {
                            [view removeFromSuperview];
                        }];
                        
                    }else
                    {
                        [view removeFromSuperview];
                    }
                }
            }
            
            
        }
    }
}


// 获取barButtonView 得到对应的tabbar
- (UIView *)getBarButttonViewWithIndex:(NSUInteger )index
{
    UIBarButtonItem *item = (UIBarButtonItem *)[self.items  objectAtIndex:index];
    UIView *barButtonView = [item valueForKey:@"view"];
    return barButtonView;

}



@end
