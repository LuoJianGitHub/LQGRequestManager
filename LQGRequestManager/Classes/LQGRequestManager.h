//
//  LQGRequestManager.h
//  LQGRequestManager
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <LQGNetworkManager/LQGNetworkManager.h>

/// 请求管理类（不直接继承LQGNetworkManager，限定业务方只能使用下面对外的方法进行接口请求）
@interface LQGRequestManager : NSObject

/// 通用请求头
@property (nonatomic, copy) NSDictionary *commonHeaders;

/// 初始化SDK
+ (void)startSDK;

/// 单例
+ (instancetype)sharedManager;

//MARK: - 模型请求

/// GET请求
/// @param URLString 请求路径
/// @param requestModel 请求参数模型
/// @param headers 请求头
/// @param completion 回调
- (NSURLSessionDataTask *)GET:(NSString *)URLString
                 requestModel:(LQGBaseRequestModel *)requestModel
                      headers:(NSDictionary *)headers
                   completion:(MCompletion)completion;

/// POST请求
/// @param URLString 请求路径
/// @param requestModel 请求参数模型
/// @param headers 请求头
/// @param completion 回调
- (NSURLSessionDataTask *)POST:(NSString *)URLString
                  requestModel:(LQGBaseRequestModel *)requestModel
                       headers:(NSDictionary *)headers
                    completion:(MCompletion)completion;

/// 通用请求
/// @param HTTPMethod 请求方式
/// @param URLString 请求路径
/// @param requestModel 请求参数模型
/// @param headers 请求头
/// @param completion 回调
- (NSURLSessionDataTask *)HTTPMethod:(LQGHTTPMethod)HTTPMethod
                           URLString:(NSString *)URLString
                        requestModel:(LQGBaseRequestModel *)requestModel
                             headers:(NSDictionary *)headers
                          completion:(MCompletion)completion;

//MARK: - 字典请求

/// GET请求
/// @param URLString 请求路径
/// @param parameters 请求参数字典
/// @param headers 请求头
/// @param completion 回调
- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                      headers:(NSDictionary *)headers
                   completion:(MCompletion)completion;

/// POST请求
/// @param URLString 请求路径
/// @param parameters 请求参数字典
/// @param headers 请求头
/// @param completion 回调
- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                       headers:(NSDictionary *)headers
                    completion:(MCompletion)completion;

/// 通用请求
/// @param HTTPMethod 请求方式
/// @param URLString 请求路径
/// @param parameters 请求参数字典
/// @param headers 请求头
/// @param completion 回调
- (NSURLSessionDataTask *)HTTPMethod:(LQGHTTPMethod)HTTPMethod
                           URLString:(NSString *)URLString
                          parameters:(NSDictionary *)parameters
                             headers:(NSDictionary *)headers
                          completion:(MCompletion)completion;

@end
