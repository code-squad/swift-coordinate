//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    
    private(set) var leftTop: MyPoint
    private(set) var rightBottom: MyPoint
    
    init() {
        leftTop = MyPoint()
        rightBottom = MyPoint()
    }
        
    init(origin: MyPoint, size: CGSize) {
        let moveX = Float(size.width/2)
        let moveY = Float(size.height/2)
        leftTop = MyPoint(x: origin.x-moveX, y: origin.y+moveY)
        rightBottom = MyPoint(x: origin.x+moveX, y: origin.y-moveY)
    }
}

// MARK: Methods
extension MyRect {
    
    func areaRect() -> Double {
        let leftBottom = MyPoint(x: leftTop.x, y: rightBottom.y)
        let bottomLine = MyLine(pointA: leftBottom , pointB: rightBottom).distance()
        let height = MyLine(pointA: leftBottom, pointB: leftTop).distance()
        return bottomLine * height
    }
}
