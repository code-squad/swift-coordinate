//
//  DrawableFactory.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct DrawableFactory{
   static func createDrawable(type:CoordinateFormat,points:[PointTuple]) throws ->Drawable{
        switch type {
        case .point:
            return try MyPoint.init(points[0])
        case .line :
            return MyLine.init(try MyPoint(points[0]), try MyPoint(points[1]))
        }
    }
}

