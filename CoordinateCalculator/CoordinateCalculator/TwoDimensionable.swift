//
//  TwoDimensionable.swift
//  CoordinateCalculator
//
//  Created by hw on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol TwoDimensionable: Shapable, CustomStringConvertible{
    var shapeInformation : Double {get}
}

extension TwoDimensionable {
    var description: String {
        switch self{
        case is Linable:
            return "두 점 사이의 거리는 "
        case is Trianglable:
            return "삼각형의 넓이는 "
        default:
            return ""
        }
    }
}
