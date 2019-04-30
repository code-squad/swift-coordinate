//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    static public func convert(_ pairs: [(x:String, y:String)]) throws -> [Pair] {
        var convertedPairs = [Pair]()
        for pair in pairs {
            guard let convertedX = Int(pair.x), let convertedY = Int(pair.y) else {
                throw ConverterError.impossibleToConvert
            }
            
            convertedPairs.append((convertedX, convertedY))
        }
        return convertedPairs
    }
}
