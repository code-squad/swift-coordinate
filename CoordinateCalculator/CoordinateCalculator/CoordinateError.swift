//
//  CustomError.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 9..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

enum CoordinateError: Error {
    case noCommaError
    case noBracketError
    case inputValueError
    case theRestError
    case outOfAvailableInputValue
    case inputValuesOfLineError
}
