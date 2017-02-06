//
//  UITableView+Additions.h
//  NTToolLibrary
//
//  Created by NTTian on 2017/2/6.
//  Copyright © 2017年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Additions)

/**
 tableView EmptyData 展示

 @param message 文字内容
 @param imagePath 图片名称
 @param rowCount 0
 */
- (void) tableViewDisplayWitMsg:(NSString *) message withImage:(NSString *)imagePath ifNecessaryForRowCount:(NSUInteger) rowCount;

@end
