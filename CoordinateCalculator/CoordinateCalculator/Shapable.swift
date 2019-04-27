//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by hw on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Shapable: Drawable {
    var myPointList: [Point] {get}
    var myShapeInformation: Double {get}
    func displayShapeInformation() -> String
}

extension Shapable {
    var myShapeInformation: Double {
        get{
            return 0
        }
    }
    func displayShapeInformation() -> String {
        return ""
    }
}

