//
//  Int+Random.swift
//  NameGenerator
//
//  Created by Jason Larsen on 1/1/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import Foundation

extension Int {
    /// random int between upper and lower, but not including upper (i.e. a member of lower..<upper)
    public static func random(lower lower: Int , upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower )))
    }
}