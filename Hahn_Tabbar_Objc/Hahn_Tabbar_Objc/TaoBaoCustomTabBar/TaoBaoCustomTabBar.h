//
//  TaoBaoCustomTabBar.h
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/6/28.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TaoBaoCustomTabBar;

@protocol TaoBaoCustomTabBarDelegate <UITabBarDelegate>

@optional
// 当点击自定义tabbar的时候
- (void)tabBarDidClickPlusButton:(TaoBaoCustomTabBar *)tabBar;

@end


@interface TaoBaoCustomTabBar : UITabBar

@property (nonatomic, strong) UIButton *plusButton;

@property (nonatomic, weak) id<TaoBaoCustomTabBarDelegate> myDelegate;

@end

NS_ASSUME_NONNULL_END
