//
//  Token.swift
//  NameGenerator
//
//  Created by Jason Larsen on 1/1/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import Foundation

enum Token : Hashable, Equatable {
    case Letter(Character)
    case End
    
    var hashValue: Int {
        switch self {
        case let .Letter(string):
            return string.hashValue
        case .End:
            return "".hashValue
        }
    }
}

func == (lhs: Token, rhs: Token) -> Bool {
    switch (lhs, rhs) {
    case let (.Letter(l), .Letter(r)):
        return l == r
    case (.End, .End):
        return true
    default:
        return false
    }
}