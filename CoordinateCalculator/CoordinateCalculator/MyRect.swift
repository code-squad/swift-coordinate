//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    private var leftTop = MyPoint()
    private var rightBottom = MyPoint()
    
    init(origin: MyPoint, size: CGSize) {
        //로직구현
    }
    
    func areaRect() -> Double {
        let leftBottom = MyPoint(x: leftTop.x, y: rightBottom.y)
        let bottonLine = MyLine(pointA: leftBottom , pointB: rightBottom).distance()
        let height = MyLine(pointA: leftBottom, pointB: leftTop).distance()
        return bottonLine * height
    }
}
