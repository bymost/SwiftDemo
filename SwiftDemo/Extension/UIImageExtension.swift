//
//  UIImageExtension.swift
//  SwiftDemo
//
//  Created by bymost on 2017/8/29.
//  Copyright © 2017年 bymost. All rights reserved.
//

import UIKit

extension UIImage {
    /*
     * 根据给定的字节长度压缩图片 只压缩像素 不改变尺寸
     * 注意: 并不一定会将图片压缩到给定的值
     * UIImageJPEGRepresentation(_, _) 压缩图片存在极限值
     * UIImageJPEGRepresentation(_, _) 会严重消耗内存,
     */
    func dataSmallerThan(dataLength: Int) -> Data {
        var compressionQuality: CGFloat = 1.0;
        var data = UIImageJPEGRepresentation(self, compressionQuality)!
        var limit = 0 //极限值 并不是所有图片都可以压缩到指定大小 压缩到最小后 将不会在进行压缩
        while (data.count > dataLength) && (limit != data.count) {
            compressionQuality *= 0.9
            limit = data.count
            data = UIImageJPEGRepresentation(self, compressionQuality)!
        }
        return data
    }
    
    func dataForUpload() -> Data{
        return dataSmallerThan(dataLength: 1024 * 1000)// 限制1MB
    }
}
