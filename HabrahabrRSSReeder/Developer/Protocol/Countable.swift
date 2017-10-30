//
//  Countable.swift
//  beerga
//
//  Created Yury Radchenko on 28.05.17.
//  Copyright © 2017 iPadchenko. All rights reserved.
//
//

/*
 Протокол добавляет enum 2 переменные:
 - count - количество case в enum
 - allValues - все case массивом
 */

import Foundation

protocol Countable: Hashable { }

extension Countable {
    
    public static var allValues: [Self] {
        let allVals = self.allValuesSequence
        var returnArray: [Self] = []
        for item in allVals {
            returnArray.append(item)
        }
        return returnArray
    }
    
    public static var count: Int {
        typealias S = Self
        var i = 1
        while (withUnsafePointer(to: &i) {
            $0.withMemoryRebound(to:S.self, capacity:1) { $0.pointee.hashValue != 0 }
        }) {
            i += 1
        }
        return i
    }
    
    private static var allValuesSequence: AnySequence<Self> {
        typealias S = Self
        return AnySequence { () -> AnyIterator<S> in
            var raw = 0
            return AnyIterator {
                let current : Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: S.self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else { return nil }
                raw += 1
                return current
            }
        }
    }
}
