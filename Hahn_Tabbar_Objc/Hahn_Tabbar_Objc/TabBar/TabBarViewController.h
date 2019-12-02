//
//  TabBarViewController.h
//  Hahn_Tabbar_Objc
//
//  Created by Hahn on 2019/6/24.
//  Copyright © 2019 Hahn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TabBarViewController : UITabBarController

@property (nonatomic, assign) BOOL isBadge;                                 // true是自定义小红点 false是常规的

@end

NS_ASSUME_NONNULL_END
