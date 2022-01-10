//
//  utils.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/10/22.
//

import Foundation


extension Int {
    static func getUniqueRandomNumbers(min: Int, max: Int, count: Int) -> [Int] {
        var set = Set<Int>()
        while set.count < count {
            set.insert(Int.random(in: min...max))
        }
        return Array(set)
    }
}
