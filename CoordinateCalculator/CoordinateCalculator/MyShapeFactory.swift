//
//  MyShapeFactory.swift
//  CoordinateCalculator
//
//  Created by hw on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyShapeFactory: ShapeCreatable {
   static func createShape(pointList: [Pair] ) -> Shapable {
        switch pointList.count {
        case 1:
            let myShape: Shapable = MyPoint.init(pointList: pointList)
            return myShape
        case 2:
            let myShape: Shapable = MyLine.init(pointList: pointList)
            return myShape
        default:
            let myShape: Shapable = MyPoint.init(pointList: pointList)
            return myShape
        }
    }
}
