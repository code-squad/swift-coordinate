//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by hw on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Drawable {
    /// Shapable protocol
    var myPointList: [Point]
    
    var myShapeInformation : Double {
        get{
            let xDistance = myPointList[0].x - myPointList[1].x
            let yDistance = myPointList[0].y - myPointList[1].y
            return sqrt(Double ((xDistance * xDistance) + (yDistance * yDistance)))
        }
    }
    
    init(pointList: [Pair]){
        myPointList = [Point]()
        for point in pointList {
            myPointList.append(Point.init(x: point.x, y: point.y))
        }
    }
    
    /// Drawable protocol function
    func drawShape() -> String{
        var drawingShape = ""
        for myPoint in myPointList {
            drawingShape += "\(ANSICode.text.whiteBright)\(ANSICode.point.drawPoint(myPoint))"
        }
        return drawingShape
    }
    
    func displayShapeInformation() -> String {
        let information = "\(ANSICode.text.blueBright)\(ANSICode.line.displayDistance(self))\(ANSICode.text.whiteBright)"
        return information
    }
}
