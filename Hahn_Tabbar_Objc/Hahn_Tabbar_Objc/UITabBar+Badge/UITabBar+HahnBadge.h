//
//  UITabBar+HahnBadge.h
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/12/2.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (HahnBadge)

@property (nonatomic,assign) CGSize badgeSize;                                      // 小红点size
@property (nonatomic,strong) UIImage *badgeImage;                                   // 小红点图片
@property (nonatomic,strong) UIColor *badgeColor;                                   // 小红点颜色
@property (nonatomic,assign) CGPoint badgePoint;                                    // 小红点的x、y值
@property (nonatomic,copy) NSString *badgeValue;                                    // 小红点的数字


/**
 显示小红点
 param: index 对应的tabbar下标
 */
- (void)showBadgeOnItemIndex:(NSUInteger )index;

/**
 隐藏小红点
 param: index 对应的tabbar下标
 param:animation 是否需要动画效果
 */
- (void)hiddenRedPointOnIndex:(NSUInteger )index animation:(BOOL )animation;

@end

NS_ASSUME_NONNULL_END
