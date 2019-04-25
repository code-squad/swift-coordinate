//
//  CoordinateError.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateError: Error {
    enum kind {
        case invalidInputFormat
        case impossibleToParse
        case outOfAxisRange
    }
    
    let noticeMessage: String
}
