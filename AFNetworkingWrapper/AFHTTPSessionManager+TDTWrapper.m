//
//  AFHTTPSessionManager+TDTWrapper.m
//  Gordon
//
//  Created by Yash Bhardwaj on 3/20/18.
//

#import "AFHTTPSessionManager+TDTWrapper.h"

static NSString * const SnippedText = @"--snipped--";

@implementation AFHTTPSessionManager (TDTWrapper)

- (NSString *)tdt_snipTexts:(NSArray<NSString *> *)textsToSnip
                 fromString:(NSString *)string {
  NSAssert(textsToSnip != nil, @"textsToSnip should not be nil");
  NSAssert(string != nil, @"string should not be nil");
  __block NSString *snippedString = [string copy];
  for (NSString *textToSnip in textsToSnip) {
    snippedString = [snippedString stringByReplacingOccurrencesOfString:textToSnip
                                                             withString:SnippedText];
  }
  
  return snippedString;
}

- (NSURL *)tdt_snipTexts:(NSArray<NSString *> *)textsToSnip
                  fromURL:(NSURL *)URL {
  NSAssert(textsToSnip != nil, @"textsToSnip should not be nil");
  NSAssert(URL != nil, @"URL should not be nil");
  NSString *snippedAbosulteURLString = [self tdt_snipTexts:textsToSnip
                                                fromString:[URL absoluteString]];
  NSURL *snippedURL = [NSURL URLWithString:snippedAbosulteURLString];
  return snippedURL;
}

/**
 Snip text from userInfo only till level 1 i.e  userInfo is not parsed recursively to filter
 container objects like NSDictionary, NSArray and NSSet.
 Sni texts from objects of type NSString, NSURL and NSHTTPURLResponse.
 */
- (NSDictionary *)tdt_snipTexts:(NSArray<NSString *> *)textsToSnip
                   fromUserInfo:(NSDictionary *)userInfo {
  NSAssert(textsToSnip != nil, @"textsToSnip should not be nil");
  NSAssert(userInfo != nil, @"userInfo should not be nil");
  NSMutableDictionary *snippedUserInfo = [NSMutableDictionary dictionary];
  [userInfo enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    if ([obj isKindOfClass:[NSString class]]) {
      NSString *snippedString = [self tdt_snipTexts:textsToSnip fromString:obj];
      [snippedUserInfo setObject:snippedString forKey:key];
    } else if ([obj isKindOfClass:[NSHTTPURLResponse class]]) {
      NSHTTPURLResponse *response = (NSHTTPURLResponse*)obj;
      NSURL *snippedURL = [self tdt_snipTexts:textsToSnip fromURL:response.URL];
      NSHTTPURLResponse *snippedResponse = [[NSHTTPURLResponse alloc] initWithURL:snippedURL
                                                                       statusCode:response.statusCode
                                                                      HTTPVersion:@"HTTP/1.1"
                                                                     headerFields:response.allHeaderFields];
      [snippedUserInfo setObject:snippedResponse forKey:key];
    } else if ([obj isKindOfClass:[NSURL class]]) {
      NSURL *snippedURL = [self tdt_snipTexts:textsToSnip fromURL:obj];
      [snippedUserInfo setObject:snippedURL forKey:key];
    } else {
      [snippedUserInfo setObject:obj forKey:key];
    }
  }];
  return snippedUserInfo;
}

/**
 Snip text from userInfo.
 */
- (NSError *)tdt_snipTexts:(NSArray<NSString *> *)textsToSnip
                 fromError:(NSError *)error {
#if defined(TDT_ADHOC_DEBUG) || defined(DEBUG)
  return error;
#else
  NSDictionary *userInfo = error.userInfo;
  if (userInfo !=nil && textsToSnip != nil) {
    return [NSError errorWithDomain:error.domain
                               code:error.code
                           userInfo:[self tdt_snipTexts:textsToSnip
                                           fromUserInfo:userInfo]];
  } else {
    return error;
  }
#endif
}

- (NSURLSessionDataTask *)tdt_GET:(NSString *)URLString
                       parameters:(id)parameters
             textsToSnipFromError:(NSArray<NSString *> *)textsToSnipFromError
                          success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success
                          failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
  return [self GET:URLString
        parameters:parameters
           success:success
           failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             if (failure != nil) {
               failure(task, [self tdt_snipTexts:textsToSnipFromError
                                       fromError:error]);
             }
           }];
}

- (NSURLSessionDataTask *)tdt_HEAD:(NSString *)URLString
                        parameters:(id)parameters
              textsToSnipFromError:(NSArray<NSString *> *)textsToSnipFromError
                           success:(void (^)(NSURLSessionDataTask * _Nonnull))success
                           failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
  return [self HEAD:URLString
         parameters:parameters
            success:success
            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              if (failure != nil) {
                failure(task, [self tdt_snipTexts:textsToSnipFromError
                                        fromError:error]);
              }
            }];
}

- (NSURLSessionDataTask *)tdt_POST:(NSString *)URLString
                        parameters:(id)parameters
              textsToSnipFromError:(NSArray<NSString *> *)textsToSnipFromError
                           success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success
                           failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
  return [self POST:URLString
         parameters:parameters
            success:success
            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              if (failure != nil) {
                failure(task, [self tdt_snipTexts:textsToSnipFromError
                                        fromError:error]);
              }
            }];
}

- (NSURLSessionDataTask *)tdt_POST:(NSString *)URLString
                        parameters:(id)parameters
              textsToSnipFromError:(NSArray<NSString *> *)textsToSnipFromError
         constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> _Nonnull))block
                           success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success
                           failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
  return [self POST:URLString
         parameters:parameters
constructingBodyWithBlock:block
            success:success
            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              if (failure != nil) {
                failure(task, [self tdt_snipTexts:textsToSnipFromError
                                        fromError:error]);
              }
            }];
}

- (NSURLSessionDataTask *)tdt_PUT:(NSString *)URLString
                       parameters:(id)parameters
             textsToSnipFromError:(NSArray<NSString *> *)textsToSnipFromError
                          success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success
                          failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
  return [self PUT:URLString
        parameters:parameters
           success:success
           failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             if (failure != nil) {
               failure(task, [self tdt_snipTexts:textsToSnipFromError
                                       fromError:error]);
             }
           }];
}

- (NSURLSessionDataTask *)tdt_PATCH:(NSString *)URLString
                         parameters:(id)parameters
               textsToSnipFromError:(NSArray<NSString *> *)textsToSnipFromError
                            success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success
                            failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
  return [self PATCH:URLString
          parameters:parameters
             success:success
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               if (failure != nil) {
                 failure(task, [self tdt_snipTexts:textsToSnipFromError
                                         fromError:error]);
               }
             }];
}

- (NSURLSessionDataTask *)tdt_DELETE:(NSString *)URLString
                          parameters:(id)parameters
                textsToSnipFromError:(NSArray<NSString *> *)textsToSnipFromError
                             success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success
                             failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
  return [self DELETE:URLString
           parameters:parameters
              success:success
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure != nil) {
                  failure(task, [self tdt_snipTexts:textsToSnipFromError
                                          fromError:error]);
                }
              }];
}

@end
