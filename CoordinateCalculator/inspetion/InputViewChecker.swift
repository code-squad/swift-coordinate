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
        try validInputChecker(checkerFormat)
        // ) 로 끝나고 - 은 옵셔널 -> (0,0) or (0,0)-(0,0)
        let COORDINATE_VALID_PATTERN = "\\(([0-9]|1[0-9]|2[0-4]),([0-9]|1[0-9]|2[0-4])\\)$-?"
        
        guard let regex = try? NSRegularExpression(pattern: COORDINATE_VALID_PATTERN) else {
            throw CoordinateError.regexError
        }
        guard regex.matches(in: checkerFormat, options: [], range: NSMakeRange(0, checkerFormat.count)).count > 0 else {
            throw CoordinateError.invalidInputError
        }
    }
    
    // 입력 가능한 문자 체크
    static func validInputChecker(_ checkerFormat: String) throws {
        let COORDINATE_VALID_STRING = "0123456789()-,"
        let validInput = CharacterSet.init(charactersIn: COORDINATE_VALID_STRING)
        
        guard checkerFormat.components(separatedBy: validInput).joined().count <= 0 else {
            throw CoordinateError.imPossibleStringError
        }
    }
}
