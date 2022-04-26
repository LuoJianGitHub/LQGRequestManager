//
//  LQGRequestManager.m
//  LQGRequestManager
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import "LQGRequestManager.h"

@interface LQGRequestManager ()

@property (nonatomic, strong) LQGNetworkManager *networkManager;

@end

@implementation LQGRequestManager


#pragma mark - 单例

+ (instancetype)sharedManager {
    static LQGRequestManager *_sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[LQGRequestManager alloc] init];
    });
    return _sharedManager;
}


#pragma mark - 请求

//MARK: - 模型请求

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                 requestModel:(LQGBaseRequestModel *)requestModel
                      headers:(NSDictionary *)headers
                   completion:(MCompletion)completion {
    [self.networkManager GET:URLString
                requestModel:requestModel
                     headers:[self handleHeaders:headers]
                  completion:completion];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                  requestModel:(LQGBaseRequestModel *)requestModel
                       headers:(NSDictionary *)headers
                    completion:(MCompletion)completion {
    [self.networkManager POST:URLString
                 requestModel:requestModel
                      headers:[self handleHeaders:headers]
                   completion:completion];
}

- (NSURLSessionDataTask *)HTTPMethod:(LQGHTTPMethod)HTTPMethod
                           URLString:(NSString *)URLString
                        requestModel:(LQGBaseRequestModel *)requestModel
                             headers:(NSDictionary *)headers
                          completion:(MCompletion)completion {
    [self.networkManager HTTPMethod:HTTPMethod
                          URLString:URLString
                       requestModel:requestModel
                            headers:[self handleHeaders:headers]
                         completion:completion];
}

//MARK: - 字典请求

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                      headers:(NSDictionary *)headers
                   completion:(MCompletion)completion {
    [self.networkManager GET:URLString
                  parameters:parameters
                     headers:[self handleHeaders:headers]
                  completion:completion];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                       headers:(NSDictionary *)headers
                    completion:(MCompletion)completion {
    [self.networkManager POST:URLString
                   parameters:parameters
                      headers:[self handleHeaders:headers]
                   completion:completion];
}

- (NSURLSessionDataTask *)HTTPMethod:(LQGHTTPMethod)HTTPMethod
                           URLString:(NSString *)URLString
                          parameters:(NSDictionary *)parameters
                             headers:(NSDictionary *)headers
                          completion:(MCompletion)completion {
    [self.networkManager HTTPMethod:HTTPMethod
                          URLString:URLString
                         parameters:parameters
                            headers:[self handleHeaders:headers]
                         completion:completion];
}


#pragma mark - Other Method

+ (void)startSDK {
    
}

/// 处理请求头（可以在这个方法中接受请求参数，统一处理接口加签）
/// @param headers 请求头
- (NSDictionary *)handleHeaders:(NSDictionary *)headers {
    NSMutableDictionary *realHeaders = [NSMutableDictionary dictionary];
    [realHeaders addEntriesFromDictionary:self.commonHeaders];
    [realHeaders addEntriesFromDictionary:headers];
    return realHeaders;
}


#pragma mark - Lazy

- (LQGNetworkManager *)networkManager {
    if (!_networkManager) {
        _networkManager = [LQGNetworkManager manager];
        _networkManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _networkManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _networkManager.requestSerializer.timeoutInterval = 30.f;
    }
    return _networkManager;
}

@end
