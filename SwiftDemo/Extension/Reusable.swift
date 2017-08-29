//
//  Reusable.swift
//  SwiftDemo
//
//  Created by bymost on 2017/4/20.
//  Copyright © 2017年 bymost. All rights reserved.
//

import UIKit

protocol Reusable: class {
    static var reuseIdentifier: String{get}
}

extension Reusable{
    static var reuseIdentifier: String{
        return String(describing: Self.self)
    }
}
