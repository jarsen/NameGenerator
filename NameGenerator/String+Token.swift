//
//  String+Token.swift
//  NameGenerator
//
//  Created by Jason Larsen on 1/1/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import Foundation

extension String {
    func tokenize() -> [Token] {
        var tokens = characters.map { Token.Letter($0) }
        tokens.append(.End)
        return tokens
    }
}