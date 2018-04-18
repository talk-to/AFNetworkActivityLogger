//
//  AFHTTPSessionManager+TDTWrapper.h
//  Gordon
//
//  Created by Yash Bhardwaj on 3/20/18.
//

#import <AFNetworking/AFNetworking.h>

/**
 Wrapper on top of AFHTTPSessionManager to snip sensitive text from the NSError user info in case of failure.
 */
@interface AFHTTPSessionManager (TDTWrapper)

NS_ASSUME_NONNULL_BEGIN

///---------------------------
/// @name Making HTTP Requests
///---------------------------

/**
 Creates and runs an `NSURLSessionDataTask` with a `GET` request.
 
 @param URLString The URL string used to create the request URL.
 @param parameters The parameters to be encoded according to the client request serializer.
 @param textsToSnipFromError The list of text that should be snipped from error in case of failure.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the data task, and the response object created by the client response serializer.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes a two arguments: the data task and the error describing the network or parsing error that occurred.
 
 @see -dataTaskWithRequest:completionHandler:
 */
- (nullable NSURLSessionDataTask *)tdt_GET:(NSString *)URLString
                                parameters:(nullable id)parameters
                      textsToSnipFromError:(nullable NSArray<NSString *> *)textsToSnipFromError
                                   success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
                                   failure:(nullable void (^)(NSURLSessionDataTask * __nullable task, NSError *error))failure;

/**
 Creates and runs an `NSURLSessionDataTask` with a `HEAD` request.
 
 @param URLString The URL string used to create the request URL.
 @param parameters The parameters to be encoded according to the client request serializer.
 @param textsToSnipFromError The list of text that should be snipped from error in case of failure.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes a single arguments: the data task.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes a two arguments: the data task and the error describing the network or parsing error that occurred.
 
 @see -dataTaskWithRequest:completionHandler:
 */
- (nullable NSURLSessionDataTask *)tdt_HEAD:(NSString *)URLString
                                 parameters:(nullable id)parameters
                       textsToSnipFromError:(nullable NSArray<NSString *> *)textsToSnipFromError
                                    success:(nullable void (^)(NSURLSessionDataTask *task))success
                                    failure:(nullable void (^)(NSURLSessionDataTask * __nullable task, NSError *error))failure;

/**
 Creates and runs an `NSURLSessionDataTask` with a `POST` request.
 
 @param URLString The URL string used to create the request URL.
 @param parameters The parameters to be encoded according to the client request serializer.
 @param textsToSnipFromError The list of text that should be snipped from error in case of failure.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the data task, and the response object created by the client response serializer.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes a two arguments: the data task and the error describing the network or parsing error that occurred.
 
 @see -dataTaskWithRequest:completionHandler:
 */
- (nullable NSURLSessionDataTask *)tdt_POST:(NSString *)URLString
                                 parameters:(nullable id)parameters
                       textsToSnipFromError:(nullable NSArray<NSString *> *)textsToSnipFromError
                                    success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
                                    failure:(nullable void (^)(NSURLSessionDataTask * __nullable task, NSError *error))failure;

/**
 Creates and runs an `NSURLSessionDataTask` with a multipart `POST` request.
 
 @param URLString The URL string used to create the request URL.
 @param parameters The parameters to be encoded according to the client request serializer.
 @param textsToSnipFromError The list of text that should be snipped from error in case of failure.
 @param block A block that takes a single argument and appends data to the HTTP body. The block argument is an object adopting the `AFMultipartFormData` protocol.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the data task, and the response object created by the client response serializer.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes a two arguments: the data task and the error describing the network or parsing error that occurred.
 
 @see -dataTaskWithRequest:completionHandler:
 */
- (nullable NSURLSessionDataTask *)tdt_POST:(NSString *)URLString
                                 parameters:(nullable id)parameters
                       textsToSnipFromError:(nullable NSArray<NSString *> *)textsToSnipFromError
                  constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                                    success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
                                    failure:(nullable void (^)(NSURLSessionDataTask * __nullable task, NSError *error))failure;

/**
 Creates and runs an `NSURLSessionDataTask` with a `PUT` request.
 
 @param URLString The URL string used to create the request URL.
 @param parameters The parameters to be encoded according to the client request serializer.
 @param textsToSnipFromError The list of text that should be snipped from error in case of failure.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the data task, and the response object created by the client response serializer.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes a two arguments: the data task and the error describing the network or parsing error that occurred.
 
 @see -dataTaskWithRequest:completionHandler:
 */
- (nullable NSURLSessionDataTask *)tdt_PUT:(NSString *)URLString
                                parameters:(nullable id)parameters
                      textsToSnipFromError:(nullable NSArray<NSString *> *)textsToSnipFromError
                                   success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
                                   failure:(nullable void (^)(NSURLSessionDataTask * __nullable task, NSError *error))failure;

/**
 Creates and runs an `NSURLSessionDataTask` with a `PATCH` request.
 
 @param URLString The URL string used to create the request URL.
 @param parameters The parameters to be encoded according to the client request serializer.
 @param textsToSnipFromError The list of text that should be snipped from error in case of failure.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the data task, and the response object created by the client response serializer.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes a two arguments: the data task and the error describing the network or parsing error that occurred.
 
 @see -dataTaskWithRequest:completionHandler:
 */
- (nullable NSURLSessionDataTask *)tdt_PATCH:(NSString *)URLString
                                  parameters:(nullable id)parameters
                        textsToSnipFromError:(nullable NSArray<NSString *> *)textsToSnipFromError
                                     success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
                                     failure:(nullable void (^)(NSURLSessionDataTask * __nullable task, NSError *error))failure;

/**
 Creates and runs an `NSURLSessionDataTask` with a `DELETE` request.
 
 @param URLString The URL string used to create the request URL.
 @param parameters The parameters to be encoded according to the client request serializer.
 @param textsToSnipFromError The list of text that should be snipped from error in case of failure.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the data task, and the response object created by the client response serializer.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes a two arguments: the data task and the error describing the network or parsing error that occurred.
 
 @see -dataTaskWithRequest:completionHandler:
 */
- (nullable NSURLSessionDataTask *)tdt_DELETE:(NSString *)URLString
                                   parameters:(nullable id)parameters
                         textsToSnipFromError:(nullable NSArray<NSString *> *)textsToSnipFromError
                                      success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
                                      failure:(nullable void (^)(NSURLSessionDataTask * __nullable task, NSError *error))failure;

NS_ASSUME_NONNULL_END

@end
