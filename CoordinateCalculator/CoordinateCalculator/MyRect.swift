//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by Elena on 07/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: FigureProtocol , DistanceProtocol{
    
    private var leadingTop = MyPoint(x: 0, y: 0)
    private var trailingBottom = MyPoint(x: 0, y: 0)
    private var datumPoint = MyPoint(x: 0, y: 0)
    
    init(origin: MyPoint, size: CGSize) {
        self.leadingTop = origin
        self.trailingBottom = MyPoint(x: leadingTop.x + Int(size.width), y: leadingTop.y - Int(size.height))
    }
    
    init(points: [MyPoint]) {
        let points = points.sorted(by: {$0.x < $1.x})
        self.datumPoint = MyPoint(x: points[0].x, y: points[0].y)
        self.leadingTop = MyPoint(x: points[1].x, y: points[1].y)
        self.trailingBottom = MyPoint(x: points[2].x, y: points[2].y)
        
    }
    
    var points: [MyPoint] {
        return []
    }
    
    var descriptionTwoPoint: String {
        return "사각형의 넓이는"
    }
    
    var valueOfPoint: Double {
        //print(MyLine(MyPoint(x: points[0].x, y: points[0].y), MyPoint(x: points[1].x, y: points[1].y)).valueOfPoint * MyLine(MyPoint(x: points[0].x, y: points[0].y), MyPoint(x: points[2].x, y: points[2].y)).valueOfPoint)
        let lineA = MyLine(self.datumPoint,self.leadingTop).valueOfPoint
        let lineB = MyLine(self.datumPoint,self.trailingBottom).valueOfPoint
        return lineA * lineB
    }
}
