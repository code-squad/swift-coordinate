//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 24/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect : Drawable, Explanation {
    var points: [MyPoint]
    
    var leftTop = MyPoint()
    var rightBottom = MyPoint()
    var rightTop = MyPoint()
    var leftBottom = MyPoint()
    
    init(_ origin: MyPoint, _ size: CGSize) {
        self.leftBottom = MyPoint(x: origin.x, y: origin.y)
        self.leftTop = MyPoint(x: origin.x, y: origin.y + Int(size.height))
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y)
        self.rightTop = MyPoint(x: origin.x + Int(size.width), y: Int(size.height))
        self.points = [leftBottom,rightBottom,rightTop,leftTop]
    }
    
    init(_ pointA: MyPoint, _ pointB: MyPoint, _ pointC: MyPoint, _ pointD: MyPoint) {
        self.points = [pointA,pointB,pointC,pointD]
        self.leftBottom = pointA
        self.rightBottom = pointB
        self.rightTop = pointC
        self.leftTop = pointD
    }
    
    private var area: Double {
        let width = rightBottom.x - leftBottom.x
        let height = leftTop.y - rightBottom.y
        return Double(width * height)
    }
    
    var explanation: String {
        return ExplanationType.rectangle.rawValue
                +  ": \(area)"
    }
}






