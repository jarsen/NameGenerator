//
//  NameGenerator.swift
//  NameGenerator
//
//  Created by Jason Larsen on 12/24/15.
//  Copyright © 2015 Jason Larsen. All rights reserved.
//

import Foundation

public typealias Name = String
typealias Count = UInt
typealias FollowingTokenRecord = (Count, [Token: Count])
typealias TokenMap = [Token: FollowingTokenRecord]

public struct NameGenerator {
    private var tokenMap: TokenMap
    private var starts = [Token]()
    
    public init(names: Set<Name>) {
        tokenMap = NameGenerator.tokenMapFrom(names)
        starts = names.filter({$0.characters.count != 0}).map({ .Letter($0.characters.first!) })
    }
    
    private static func tokenMapFrom(names: Set<Name>) -> TokenMap {
        var tokenMap = TokenMap()
        
        for name in names {
            let tokens = name.tokenize()
            for (current, next) in zip(tokens, tokens[1..<tokens.endIndex]) {
                if let (totalCount, records) = tokenMap[current] {
                    var records = records
                    let count = records[next] ?? 0
                    records[next] = count + 1
                    tokenMap[current] = (totalCount + 1, records)
                }
                else {
                    tokenMap[current] = (1, [next: 1])
                }
            }
        }
        
        return tokenMap
    }
    
    func randomStartingToken() -> Token {
        let randomIndex = Int.random(lower: 0, upper: starts.count)
        return starts[randomIndex]
    }
    
    func generateTokenFollowing(token: Token) -> Token {
        let (totalCount, records) = tokenMap[token]!
        let randomValue = Int.random(lower: 0, upper: Int(totalCount))
        
        var sum: Int = 0
        for (token, count) in records {
            sum = sum + Int(count)
            if randomValue < sum {
                return token
            }
        }
        fatalError("Impossible: picked random value higher than total")
    }
    
    func generateName() -> Name {
        var tokens = [Token]()
        var token = randomStartingToken()
        while token != .End {
            tokens.append(token)
            token = generateTokenFollowing(token)
        }
        
        return nameFromTokens(tokens)
    }
    
    private func nameFromTokens(tokens: [Token]) -> Name {
        return tokens.reduce("") { name, token in
            switch token {
            case let .Letter(character):
                return name + String(character)
            case .End:
                return name
            }
        }
    }
}