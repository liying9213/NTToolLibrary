//
//  UIViewController+Additions.m
//  NTToolLibrary
//
//  Created by NTTian on 2017/2/6.
//  Copyright © 2017年 liying. All rights reserved.
//

#import "UIViewController+Additions.h"
#import <UIColor+HexString.h>

@implementation UIViewController (Additions)

@dynamic navTitle;

- (void)setNavTitle:(NSString *)navTitle{
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 44)];
    titleLabel.text = navTitle;
    titleLabel.textColor = [UIColor colorWithHexString:@"444444"];
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
}


- (void)setNavLeftItem:(NSString *)imageName WithAction:(NSString *)action{
    self.navigationController.navigationBarHidden = NO;
    
    UIBarButtonItem *spacerItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    spacerItem.width = -10;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame =CGRectMake(0, 0, 44, 44);
    
    [btn setImage:[UIImage imageNamed:imageName]  forState:UIControlStateNormal];
    
    [btn addTarget: self action: NSSelectorFromString(action) forControlEvents: UIControlEventTouchUpInside];
    
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItems =  @[spacerItem,item];
    
}

- (void)setNavRightItemTitle:(NSString *)title ImageName:(NSString *) imageName WithThemeColor:(NSString *)themeColor WithAction:(NSString *)action{
    self.navigationController.navigationBarHidden = NO;
    
    UIBarButtonItem *spacerItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    spacerItem.width = -10;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title && imageName) {
        btn.frame =CGRectMake(0, 0, 94, 44);
        
        [btn setTitle:title forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        
        [btn setTitleColor:[UIColor colorWithHexString:themeColor] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:imageName]  forState:UIControlStateNormal];
    }
    else if(!title && imageName){
        btn.frame =CGRectMake(0, 0, 44, 44);
        
        [btn setImage:[UIImage imageNamed:imageName]  forState:UIControlStateNormal];
    }
    else if(title && !imageName){
        btn.frame =CGRectMake(0, 0, 84, 44);
        
        [btn setTitle:title forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        
        [btn setTitleColor:[UIColor colorWithHexString:themeColor] forState:UIControlStateNormal];
        
    }
    
    [btn addTarget: self action: NSSelectorFromString(action) forControlEvents: UIControlEventTouchUpInside];
    
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.rightBarButtonItems =  @[spacerItem,item];
    
}

-(BOOL)shouldAutorotate
{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}


@end
