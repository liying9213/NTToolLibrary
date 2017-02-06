//
//  NSString+Additions.h
//  NTToolLibrary
//
//  Created by NTTian on 2017/2/6.
//  Copyright © 2017年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSString (Additions)

/**
 获取string高度

 @param Font 字体
 @param Width 宽度
 @return 高度
 */
- (CGFloat)getTheSizeHeightWithFont:(UIFont*)Font WithWide:(float)Width;


/**
 获取string宽度

 @param Font 字符
 @param Height 高度
 @return 宽度
 */
- (CGFloat)getTheSizeWidthWithFont:(UIFont*)Font WithHeight:(float)Height;


/**
 String 转成 attributedString

 @return attributedString
 */
- (NSMutableAttributedString *) getTheAttributString;


/**
 json String 转成 Dictionary

 @return Dictionary
 */
- (NSDictionary *)getDictionaryFormJsonString;


/**
 获取string高度 类方法

 @param Font 字体
 @param Width 宽度
 @param str 内容
 @return 高度
 */
+ (CGFloat)getTheSizeHeightWithFont:(UIFont*)Font WithWide:(float)Width withString:(NSString *)str;


/**
 获取string宽度 类方法

 @param Font 字体
 @param Height 高度
 @param str 内容
 @return 宽度
 */
+ (CGFloat)getTheSizeWidthWithFont:(UIFont*)Font WithHeight:(float)Height withString:(NSString *)str;


/**
 获取attributedString高度 类方法

 @param Width 宽度
 @param str 内容
 @return 高度
 */
+ (CGFloat)getTheSizeHeightWithWide:(float)Width withAttributedString:(NSAttributedString *)str;


/**
 String 转成 attributedString 类方法

 @param string 内容
 @return attributedString
 */
+ (NSMutableAttributedString *) getTheAttributStringWithstring:(NSString *)string;


/**
 json String 转成 Dictionary 类方法

 @param jsonString 内容
 @return Dictionary
 */
+ (NSDictionary *)getDictionaryWithJsonString:(NSString *)jsonString;


/**
 data 转成 string

 @param data 内容
 @return string
 */
+ (NSString *)toJSONString:(id)data;

@end
