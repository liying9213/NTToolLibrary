//
//  NSString+Additions.m
//  NTToolLibrary
//
//  Created by NTTian on 2017/2/6.
//  Copyright © 2017年 liying. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

/**
 获取string高度
 
 @param Font 字体
 @param Width 宽度
 @return 高度
 */
- (CGFloat)getTheSizeHeightWithFont:(UIFont*)Font WithWide:(float)Width{
    if (!self||[self isEqualToString:@""])
    {
        return 0;
    }
    
    NSDictionary* attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           Font, NSFontAttributeName,
                           nil];
    NSMutableAttributedString *theStr=[[NSMutableAttributedString alloc] initWithString:self attributes:attrs];
    CGRect paragraphRect = [theStr boundingRectWithSize:CGSizeMake(Width, CGFLOAT_MAX)
                                                options:(NSStringDrawingUsesLineFragmentOrigin)
                                                context:nil];
    attrs=nil;
    theStr=nil;
    
    return paragraphRect.size.height;
}


/**
 获取string宽度
 
 @param Font 字符
 @param Height 高度
 @return 宽度
 */
- (CGFloat)getTheSizeWidthWithFont:(UIFont*)Font WithHeight:(float)Height{
    if (!self||[self isEqualToString:@""])
    {
        return 0;
    }
    
    NSDictionary* attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           Font, NSFontAttributeName,
                           nil];
    NSMutableAttributedString *theStr=[[NSMutableAttributedString alloc] initWithString:self attributes:attrs];
    CGRect paragraphRect =
    [theStr boundingRectWithSize:CGSizeMake(MAXFLOAT, Height)
                         options:(NSStringDrawingUsesLineFragmentOrigin)
                         context:nil];
    attrs=nil;
    theStr=nil;
    return paragraphRect.size.width;
}


/**
 String 转成 attributedString
 
 @return attributedString
 */
- (NSMutableAttributedString *) getTheAttributString{
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    return attributedString;
}


/**
 json String 转成 Dictionary
 
 @return Dictionary
 */
- (NSDictionary *)getDictionaryFormJsonString{
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


/**
 获取string高度 类方法
 
 @param Font 字体
 @param Width 宽度
 @param str 内容
 @return 高度
 */
+ (CGFloat)getTheSizeHeightWithFont:(UIFont*)Font WithWide:(float)Width withString:(NSString *)str
{
    if (!str||[str isEqualToString:@""])
    {
        return 0;
    }
    
    NSDictionary* attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           Font, NSFontAttributeName,
                           nil];
    NSMutableAttributedString *theStr=[[NSMutableAttributedString alloc] initWithString:str attributes:attrs];
    CGRect paragraphRect = [theStr boundingRectWithSize:CGSizeMake(Width, CGFLOAT_MAX)
                                                options:(NSStringDrawingUsesLineFragmentOrigin)
                                                context:nil];
    attrs=nil;
    theStr=nil;
    
    return paragraphRect.size.height;
}


/**
 获取string宽度 类方法
 
 @param Font 字体
 @param Height 高度
 @param str 内容
 @return 宽度
 */
+ (CGFloat)getTheSizeWidthWithFont:(UIFont*)Font WithHeight:(float)Height withString:(NSString *)str
{
    if (!str||[str isEqualToString:@""])
    {
        return 0;
    }
    
    NSDictionary* attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           Font, NSFontAttributeName,
                           nil];
    NSMutableAttributedString *theStr=[[NSMutableAttributedString alloc] initWithString:str attributes:attrs];
    CGRect paragraphRect =
    [theStr boundingRectWithSize:CGSizeMake(MAXFLOAT, Height)
                         options:(NSStringDrawingUsesLineFragmentOrigin)
                         context:nil];
    attrs=nil;
    theStr=nil;
    return paragraphRect.size.width;
}


/**
 获取attributedString高度 类方法
 
 @param Width 宽度
 @param str 内容
 @return 高度
 */
+ (CGFloat)getTheSizeHeightWithWide:(float)Width withAttributedString:(NSAttributedString *)str
{
    if (!str)
    {
        return 0;
    }
    
    NSMutableAttributedString *theStr=[[NSMutableAttributedString alloc] initWithAttributedString:str];
    CGRect paragraphRect =
    [theStr boundingRectWithSize:CGSizeMake(Width, MAXFLOAT)
                         options:(NSStringDrawingUsesLineFragmentOrigin)
                         context:nil];
    theStr=nil;
    return paragraphRect.size.height;
}


/**
 String 转成 attributedString 类方法
 
 @param string 内容
 @return attributedString
 */
+ (NSMutableAttributedString *) getTheAttributStringWithstring:(NSString *)string{
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    return attributedString;
}


/**
 json String 转成 Dictionary 类方法
 
 @param jsonString 内容
 @return Dictionary
 */
+ (NSDictionary *)getDictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


/**
 data 转成 string
 
 @param data 内容
 @return string
 */
+ (NSString *)toJSONString:(id)data
{
    NSError* error = nil;
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                        options:kNilOptions error:&error];
    if (error != nil){
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonString;
}

@end
