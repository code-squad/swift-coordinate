//
//  InputViewChecker.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 7..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
struct InputViewChecker {
    static func formatChekcer(checkerFormat: String) throws {
        let COORDINATE_VALID_PATTERN = "\\(([0-9]|1[0-9]|2[0-4]),([0-9]|1[0-9]|2[0-4])\\)"
        guard let regex = try? NSRegularExpression(pattern: COORDINATE_VALID_PATTERN) else {
            throw CoordinateError.regexError
        }
        guard regex.matches(in: checkerFormat, options: [], range: NSMakeRange(0, checkerFormat.count)).count > 0 else {
            throw CoordinateError.invalidInputError
        }
    }
}
