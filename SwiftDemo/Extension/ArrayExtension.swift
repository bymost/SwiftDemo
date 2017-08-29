//
//  ArrayExtension.swift
//  SwiftDemo
//
//  Created by bymost on 2017/6/20.
//  Copyright © 2017年 bymost. All rights reserved.
//

import UIKit

extension Array{
    /// 数组去重
    func filterDuplicates<E: Equatable>(_ filter: (Element) -> E) -> [Element] {
        var result = [Element]()
        for value in self {
            let key = filter(value)
            if !result.map({ filter($0)}).contains(key) {
                result.append(value)
            }
        }
        return result
    }
}
