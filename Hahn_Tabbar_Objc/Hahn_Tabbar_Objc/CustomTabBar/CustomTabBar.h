//
//  CustomTabBar.h
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/6/28.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CustomTabBar;

@protocol CustomTabBarDelegate <UITabBarDelegate>

@optional
// 当点击自定义tabbar的时候
- (void)tabBarDidClickPlusButton:(CustomTabBar *)tabBar;

@end

/**
 *Demo
 */
typedef void(^CustomTabBarBlock)(NSMutableDictionary* dict);


@interface CustomTabBar : UITabBar

@property (nonatomic, strong) UIButton *plusButton;

@property (nonatomic, weak) id<CustomTabBarDelegate> myDelegate;

// demo
@property (nonatomic, strong) CustomTabBarBlock block;

@end

NS_ASSUME_NONNULL_END
