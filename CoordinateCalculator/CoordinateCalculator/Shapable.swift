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
}

extension Shapable {
    var myShapeInformation: Double {
        get{
            return 0
        }
    }
    func getDrawablePoints() -> [Point] {
        return myPointList
    }
}

