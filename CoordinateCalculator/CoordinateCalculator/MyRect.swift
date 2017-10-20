//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    private(set) var leftTop = MyPoint()
    private(set) var rightBottom = MyPoint()
    
    init(leftTop: MyPoint, rightBottom: MyPoint) {
        self.leftTop = leftTop
        self.rightBottom = rightBottom
    }
    
    init(origin: MyPoint, size: CGSize) {
        //로직구현
    }
    
    func areaRect() -> Double {
        let leftBottom = MyPoint(x: leftTop.x, y: rightBottom.y)
        let bottomLine = MyLine(pointA: leftBottom , pointB: rightBottom).distance()
        let height = MyLine(pointA: leftBottom, pointB: leftTop).distance()
        return bottomLine * height
    }
}
