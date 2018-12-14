//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by Elena on 07/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation
/*
 // MyPoints[1]         MyPoints[3]
 //
 // MyPoints[0]         MyPoints[2]
*/
struct MyRect: FigureProtocol , DistanceProtocol{
    
    private var leftTopPoint = (MyPoint(x: 0, y: 0))
    private var leftBottomPoint = (MyPoint(x: 0, y: 0))
    private var rightTopPoint = (MyPoint(x: 0, y: 0))
    private var rightBottomPoint = (MyPoint(x: 0, y: 0))
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTopPoint = origin
        self.leftBottomPoint = MyPoint(x: origin.x + Int(size.width), y: origin.y)
        self.rightTopPoint = MyPoint(x: origin.x, y: origin.y + Int(size.height))
        self.rightBottomPoint = MyPoint(x: origin.x + Int(size.width), y: origin.y + Int(size.height))
    }
    
    init(points: [MyPoint]) {
        let points = points.sorted(by: {$0.x < $1.x})
        
        self.leftBottomPoint = points[0]
        self.leftTopPoint = points[1]
        self.rightTopPoint = points[2]
        self.rightBottomPoint = points[3]
    }
    
    var points: [MyPoint] {
        return [leftTopPoint,leftBottomPoint,rightBottomPoint,rightTopPoint]
    }
    
    var descriptionTwoPoint: String {
        return "사각형의 넓이는"
    }
    
    var valueOfPoint: Double {
        let lineA = MyLine(leftBottomPoint,leftTopPoint).valueOfPoint
        let lineB = MyLine(leftBottomPoint,rightTopPoint).valueOfPoint
        return lineA * lineB
    }
}
