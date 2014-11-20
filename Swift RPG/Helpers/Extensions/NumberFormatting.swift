//
//  NumberFormatting.swift
//  Simple RPG
//
//  Created by Xavi Matos on 10/25/14.
//  Copyright (c) 2014 Xavi Matos. All rights reserved.
//

import Foundation

extension Int {
    func format(f: String) -> String {
        return NSString(format: "%\(f)d", self)
    }
}

extension Double {
    func format(f: String) -> String {
        return NSString(format: "%\(f)f", self)
    }
}

extension Float {
    func format(f: String) -> String {
        return NSString(format: "%\(f)f", self)
    }
}
