//
//  StringUtility.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 23..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct StringUtility {
    static func hyphenSeparated(value: String) -> [String] {
        return value.components(separatedBy: "-")
    }
}
