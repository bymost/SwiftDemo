//
//  ErrorExtension.swift
//  SwiftDemo
//
//  Created by bymost on 2017/6/6.
//  Copyright © 2017年 bymost. All rights reserved.
//

import UIKit

enum ZLCustomError1: Int, Error, CustomNSError {
    case noLogin = -2                /**< 未登录*/
    case noConnectServer = -1004     /**< 不能连接到服务器*/
    case requestFailed = -1006       /**< 请求失败*/
    case requestNotFound = -1011     /**< 未找到服务*/
    case requestTimeout = -1001      /**< 请求超时*/
    case noNetwork = -1009           /**< 无网络连接*/
    case argumentInvalidate = -1016  /**< 参数格式错误*/
    case tokenInvalidate = -10002    /**< taken失效*/
    case othersRequestError = -10099 /**< 其他请求错误*/
    
    /// The domain of the error.
    public static var errorDomain: String = "ZLAppSwiftError"
    var errorCode: Int{return self.rawValue}
    var errorUserInfo: [String:Any]{
        var errorMsg: String?
        #if DEBUG
        #else
            switch self {
            case .noConnectServer:
                errorMsg = "不能连接到服务器，请稍候再试"
            case .requestFailed:
                errorMsg = "请求失败"
            case .requestNotFound:
                errorMsg = "未找到服务，请稍后再试"
            case .requestTimeout:
                errorMsg = "请求超时，请检查网络"
            case .noNetwork:
                errorMsg = "无网络连接，请检查网络"
            case .argumentInvalidate:
                errorMsg = "请求参数格式错误"
            default:
                errorMsg = errorMsg ?? "服务器错误，请稍候再试"
            }
        #endif
        return [NSLocalizedDescriptionKey : errorMsg ?? "请求数据错误，请稍后再试"]
    }
    
}

public struct ZLCustomError: CustomNSError{
    public static let errorDomain = "ZLAppSwiftError"
    public private(set) var errorCode: Int = 0
    public var errorUserInfo = [String: Any]()
    public var description: String{
        return String(format: "error %@[%d]: %@", ZLCustomError.errorDomain, errorCode, errorUserInfo[NSLocalizedDescriptionKey] as? String ?? "nil")
    }
    init(reCode: Int?, reMsg: String?) {
        if let _ = reMsg, let code = reCode{
            var message:String?
            #if DEBUG
                message = reMsg
            #else
                switch ZLError.init(rawValue: code)! {
                case ZLError.noConnectServer:
                    message = "不能连接到服务器，请稍候再试"
                case ZLError.requestFailed:
                    message = "请求失败"
                case ZLError.requestNotFound:
                    message = "未找到服务，请稍后再试"
                case ZLError.requestTimeout:
                    message = "请求超时，请检查网络"
                case ZLError.noNetwork:
                    message = "无网络连接，请检查网络"
                case ZLError.argumentInvalidate:
                    message = "请求参数格式错误"
                default:
                    message = reMsg ?? "服务器错误，请稍候再试"
                }
            #endif
            errorCode = code
            errorUserInfo[NSLocalizedDescriptionKey] = message
        }
    }
}

extension NSError{
    var zlCustomError: ZLCustomError1?{
        return (self.domain == ZLCustomError1.errorDomain ? ZLCustomError1(rawValue: self.code) : nil)
    }
    
    convenience init(customError: ZLCustomError1) {
        self.init(domain: ZLCustomError1.errorDomain, code: customError.rawValue, userInfo: customError.errorUserInfo)
    }
}


