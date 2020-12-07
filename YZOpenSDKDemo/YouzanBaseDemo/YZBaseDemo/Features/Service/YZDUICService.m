//
//  YZDUICService.m
//  YZBaseDemo
//
//  Created by Pan on 2018/3/2.
//  Copyright © 2018年 Youzan. All rights reserved.
//

#import "YZDUICService.h"

// 此处需要请求商家server端的登录注册及登出API，须由商家server端调用有赞云的登录注册接口
static NSString* const LOGIN_REQUEST_URL = @"xxx";
static NSString* const LOGIN_OUT_REQUEST_URL = @"xxx";

@implementation YZDUICService

+ (void)loginWithCompletionBlock:(void(^)(NSDictionary *info))completionBlock {
    NSURL *url = [NSURL URLWithString:LOGIN_REQUEST_URL];
    NSMutableURLRequest *requestURL = [self getRequestURL:url];
    [requestURL setHTTPMethod:@"POST"];
    // 具体参数由App与Server端敲定
    NSString *params = @"xxx=xxx&xxx=xxx";
    NSData *postData = [params dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    [requestURL setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [requestURL setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [requestURL setHTTPBody:postData];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (completionBlock) {
            if (!error) {
                NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                if (jsonDict[@"data"] != nil && [jsonDict[@"data"] isKindOfClass:[NSDictionary class]]) {
                    completionBlock(jsonDict);
                } else {
                    completionBlock(nil);
                }
            } else {
                completionBlock(nil);
            }
        }
    }];
    [task resume];
}

+ (void)logoutWithOpenUserID:(NSString *)openUserID {
    NSURL *url = [NSURL URLWithString:LOGIN_OUT_REQUEST_URL];
    NSMutableURLRequest *requestURL = [self getRequestURL:url];
    [requestURL setHTTPMethod:@"POST"];
    // 具体参数由App与Server端敲定
    NSString *params = @"xxx=xxx&xxx=xxx";
    NSData *postData = [params dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    [requestURL setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [requestURL setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [requestURL setHTTPBody:postData];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            if (jsonDict[@"data"] != nil) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                });
            }
        }
    }];
    [task resume];
}


+ (void)sendRequest:(NSURLRequest *)request
    completionBlock:(void(^)(NSDictionary *info))completionBlock
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          if (!error) {
                                              NSDictionary *resultInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:0];
                                              NSLog(@"%@", resultInfo);
                                              if ([resultInfo[@"code"] intValue] == 0) {
                                                  if (completionBlock) {
                                                      completionBlock(resultInfo);
                                                  }
                                                  return;
                                              }
                                          }
                                          if (completionBlock) {
                                              completionBlock(nil);
                                          }
                                      }];
    [dataTask resume];
}

+ (NSURLRequest *)requestWithURLString:(NSString *)urlString
                            Parameters:(NSDictionary *)parameters
{
    __block NSMutableString *queryString = [NSMutableString string];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (queryString.length > 0) {
            [queryString appendFormat:@"&%@=%@",key,obj];
        } else {
            [queryString appendFormat:@"?%@=%@",key,obj];
        }
    }];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", urlString, queryString]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    return request.copy;
}

+ (NSMutableURLRequest *)getRequestURL:(NSURL *)url {
    NSMutableURLRequest *requestURL = [NSMutableURLRequest requestWithURL:url];
    [requestURL setHTTPMethod:@"POST"];
    [requestURL setTimeoutInterval:10.0];
    [requestURL addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [requestURL addValue:@"UTF-8" forHTTPHeaderField:@"charset"];
    [requestURL setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    return requestURL;
}

@end
