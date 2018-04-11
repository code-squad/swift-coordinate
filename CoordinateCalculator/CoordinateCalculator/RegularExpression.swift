//
//  RegularExpression.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 11..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
struct Regex {
    static let extractedX = "[0-9]{1,2}"
    static let extractedY = ";[0-9]{1,2}"
    static let extractedLatters = "[ft]([━]*[\\s]*[0-9]*[\\|\\+]?)"
    static let extractAll = extractedX + extractedY + extractedLatters
}
