//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by hw on 23/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : Shapable {
    /// Shapable protocol 
    var myPointList: [Point]
    
    init(pointList: [Pair]){
        myPointList = [Point]()
        for point in pointList {
            myPointList.append(Point.init(x: point.x, y: point.y))
        }
    }
    /// Drawable protocol function
    func draw() -> String {
        var drawingShape = ""
        for myPoint in myPointList {
            drawingShape += "\(ANSICode.text.whiteBright)\(ANSICode.point.drawPoint(myPoint))"
        }
        return drawingShape
    }
    
    
}
