//
//  StringExtension.swift
//  SwiftDemo
//
//  Created by bymost on 2017/6/6.
//  Copyright © 2017年 bymost. All rights reserved.
//

import UIKit

extension String{
    /// 截取字符串
    ///
    /// - Parameters:
    ///   - start: 开始位置
    ///   - length: 长度， -1为全部
    /// - Returns: 截取的字符串
    func subString(start:Int, length: Int = -1) -> String {
        var len = length
        if len == -1 {
            len = characters.count - start
        }
        let start = self.index(startIndex, offsetBy: start)
        let end = self.index(start, offsetBy: len)
        let range = start ..< end
        return substring(with: range)
    }
    
    /// MD5加密
    var MD5: String {
        let str = self.cString(using: .utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: .utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0 ..< digestLen{
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize()
        
        return String(format: hash as String)
    }
    
    // MARK: - 时间格式化
    
    /// 自定义时间格式化
    ///
    /// - Parameters:
    ///   - formatter: 格式
    /// - Returns: 格式化后的时间
    func toDateFormatter(formatter: String) -> String {
        let dateFormat: DateFormatter = DateFormatter.init()
        dateFormat.dateFormat = "yyyy-MM-dd"
        dateFormat.timeZone = TimeZone.init(identifier: "UTC")
        if let date = dateFormat.date(from: self){
            dateFormat.dateFormat = formatter
            return dateFormat.string(from: date)
        }
        return self
    }
}

