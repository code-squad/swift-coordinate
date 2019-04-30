//
//  ErrorCode.swift
//  CoordinateCalculator
//
//  Created by hw on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum ErrorCode : Error, CustomStringConvertible {
    case InvalidInput
    case InvalidRange
    case IsNotANumber
    case SplitStringError
    case SplitCoordinatorError
    case Unknown
    case InvalidCharacter
    case ShapeCreationError
    var description: String{
        get {
            switch self {
            case .IsNotANumber:
                return "IsNotANumber Error"
            case .InvalidInput:
                return "InvalidInput Error"
            case .InvalidRange:
                return "InvalidRange Error"
            case .SplitStringError:
                return "SplitString Error"
            case .InvalidCharacter:
                return "Invalid characters Error"
            case .SplitCoordinatorError:
                return "Split Coordinator X From Y Error"
            case .ShapeCreationError:
                return "Shape Creation Error"
            case .Unknown:
                return "Unknown Error"
            }
        }
    }
}
