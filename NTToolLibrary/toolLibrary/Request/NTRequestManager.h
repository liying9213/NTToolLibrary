//
//  NTRequestManager.h
//  NTToolLibrary
//
//  Created by NTTian on 2017/2/6.
//  Copyright © 2017年 liying. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking.h>

typedef void(^ResponseBlock)(NSError *error, NSDictionary *response);

@interface NTRequestManager : NSObject


/**
 get请求

 @param url 地址
 @param params 参数
 @param block 回调
 */
+ (void)getWithURL:(NSString *)url
            params:(NSDictionary *)params
             block:(ResponseBlock)block;


/**
 post请求

 @param url 地址
 @param params 参数
 @param block 回调
 */
+ (void)postWithURL:(NSString *)url
             params:(NSDictionary *)params
              block:(ResponseBlock)block;


/**
 post请求 raw格式

 @param url 地址
 @param params 参数
 @param block 回调
 */
+ (void)postRawWithURL:(NSString *)url
                params:(NSDictionary *)params
                 block:(ResponseBlock)block;

/**
 同步post请求
 
 @param url 地址
 @param params 参数
 @param block 回调
 */
+ (void)synchronousPostWithURL:(NSString *)url
                        params:(NSDictionary *)params
                         block:(ResponseBlock)block;


/**
 下载文件

 @param paramDic 参数
 @param requestURL 地址
 @param savedPath 存储地址
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)downloadFileWithOption:(NSDictionary *)paramDic
                 withInferface:(NSString*)requestURL
                     savedPath:(NSString*)savedPath
               downloadSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               downloadFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;



/**
 上传文件

 @param url 地址
 @param path 本地地址
 @param type 文件类型
 @param params 参数
 @param block 回调
 */
+ (void)uploadWithURL:(NSString *)url
        WithImagePath:(NSString *)path
              WithType:(NSString *)type
                params:(NSDictionary *)params
                 block:(ResponseBlock)block;

@end
