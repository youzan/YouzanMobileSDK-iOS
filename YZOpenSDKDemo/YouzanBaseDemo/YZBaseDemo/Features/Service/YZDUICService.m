//
//  YZDUICService.m
//  YZBaseDemo
//
//  Created by Pan on 2018/3/2.
//  Copyright © 2018年 Youzan. All rights reserved.
//

#import "YZDUICService.h"

@implementation YZDUICService

+ (void)fetchInitTokenWithCompletionBlock:(void(^)(NSDictionary *info))completionBlock
{
    NSDictionary* params = @{
                             @"client_id" : CLIENT_ID,
                             @"client_secret" : CLIENT_SECRET
                             };
    NSURLRequest *request = [self requestWithURLString:@"https://uic.youzan.com/sso/open/initToken"
                                            Parameters:params];
    [self sendRequest:request completionBlock:completionBlock];
}

+ (void)loginWithOpenUid:(NSString *)openUID
         completionBlock:(void(^)(NSDictionary *info))completionBlock
{
    NSDictionary* params = @{
                             @"kdt_id": @(KDT_ID),
                             @"client_id" : CLIENT_ID,
                             @"client_secret" : CLIENT_SECRET,
                             @"open_user_id" : openUID,
                             };
    NSURLRequest *request = [self requestWithURLString:@"https://uic.youzan.com/sso/open/login"
                                            Parameters:params];
    [self sendRequest:request completionBlock:completionBlock];
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
@end
