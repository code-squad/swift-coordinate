//
//  Convertor.swift
//  CoordinateCalculator
//
//  Created by cushy k on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    static func remove(bracket: String) -> String {
        let result = bracket.components(separatedBy: ["(", ")"]).joined()
        return result
    }
}
