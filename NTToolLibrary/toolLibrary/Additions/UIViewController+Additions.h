//
//  UIViewController+Additions.h
//  NTToolLibrary
//
//  Created by NTTian on 2017/2/6.
//  Copyright © 2017年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Additions)
@property (nonatomic, strong) NSString * navTitle;

/**
 导航左侧按钮

 @param imageName 图片名称
 @param action 事件名称
 */
- (void)setNavLeftItem:(NSString *)imageName
            WithAction:(NSString *)action;

/**
 导航右侧按钮 （title、imageName可任意为nil，但不能同时为nil）

 @param title 文字
 @param imageName 图片名称
 @param themeColor 文字颜色
 @param action 事件名称
 */
- (void)setNavRightItemTitle:(NSString *)title
                   ImageName:(NSString *) imageName
              WithThemeColor:(NSString *)themeColor
                  WithAction:(NSString *)action;


@end
