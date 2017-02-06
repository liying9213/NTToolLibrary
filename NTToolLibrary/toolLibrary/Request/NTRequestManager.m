//
//  NTRequestManager.m
//  NTToolLibrary
//
//  Created by NTTian on 2017/2/6.
//  Copyright © 2017年 liying. All rights reserved.
//

#import "NTRequestManager.h"
#import "AFHTTPRequestOperationManager+Synchronous.h"

#define timeoutValue 8.0f

@implementation NTRequestManager

+ (void)getWithURL:(NSString *)url
            params:(NSDictionary *)params
             block:(ResponseBlock)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = timeoutValue;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    serializer.removesKeysWithNullValues = YES;
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/text",@"text/plain", nil];
    manager.responseSerializer = serializer;
    AFHTTPRequestOperation *operation = [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        block(nil, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(error,nil);
    }];
}

+ (void)postWithURL:(NSString *)url
             params:(NSDictionary *)params
              block:(ResponseBlock)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = timeoutValue;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    serializer.removesKeysWithNullValues = YES;
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/text",@"text/plain",@"text/html", nil];
    manager.responseSerializer = serializer;
    AFHTTPRequestOperation *operation = [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        block(nil, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(error,nil);
    }];
}

+ (void)postRawWithURL:(NSString *)url
                params:(NSDictionary *)params
                 block:(ResponseBlock)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = timeoutValue;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    serializer.removesKeysWithNullValues = YES;
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/text",@"text/plain",@"text/html", nil];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = serializer;
    AFHTTPRequestOperation *operation = [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        block(nil, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(error,nil);
    }];
}

+ (void)synchronousPostWithURL:(NSString *)url
                        params:(NSDictionary *)params
                         block:(ResponseBlock)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = timeoutValue;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    serializer.removesKeysWithNullValues = YES;
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/text",@"text/plain",@"text/html", nil];
    manager.responseSerializer = serializer;
    NSError *error = nil;
    NSDictionary * responseObject = [manager syncPOST:url parameters:params operation:NULL error:&error];
    
    if (error) {
        block(error,nil);
    }
    else{
        block(nil,responseObject);
    }
}

+ (void)downloadFileWithOption:(NSDictionary *)paramDic
                 withInferface:(NSString*)requestURL
                     savedPath:(NSString*)savedPath
               downloadSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               downloadFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure

{
    NSURL *url = [[NSURL alloc] initWithString:requestURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.inputStream   = [NSInputStream inputStreamWithURL:url];
    operation.outputStream  = [NSOutputStream outputStreamToFileAtPath:savedPath append:NO];
    
    //已完成下载
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //下载失败
    }];
    
    [operation start];
}

+ (void)uploadWithURL:(NSString *)url
        WithImagePath:(NSString *)path
             WithType:(NSString *)type
               params:(NSDictionary *)params
                block:(ResponseBlock)block{
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    [mgr POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSURL *url=[NSURL fileURLWithPath:path];
        //name是传输的文件的类型
        [formData appendPartWithFileURL:url name:@"file" fileName:[path lastPathComponent] mimeType:@"application/octet-stream" error:nil];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        block(nil,responseObject[0]);
        NSLog(@"OK");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(error,nil);
        NSLog(@"error");
    }];
}

@end
