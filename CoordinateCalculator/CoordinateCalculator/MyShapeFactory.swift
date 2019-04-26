//
//  MyShapeFactory.swift
//  CoordinateCalculator
//
//  Created by hw on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyShapeFactory: ShapeCreatable {
   static func createShape(pointList: [Pair] ) -> Drawable {
        switch pointList.count {
        case 1:
            let myShape: Drawable = MyPoint.init(pointList: pointList)
            return myShape
        case 2:
            let myShape: Drawable = MyLine.init(pointList: pointList)
            return myShape
        default:
            let myShape: Drawable = MyPoint.init(pointList: pointList)
            return myShape
        }
    }
}
