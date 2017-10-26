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
        leftTop = MyPoint(x: origin.x, y: origin.y)
        rightBottom = MyPoint(x: origin.x+Int(size.width), y: origin.y-Int(size.height))
    }
}

// MARK: Methods
extension MyRect {
    
    static func isRect(_ pointArray: [MyPoint]) -> Bool {
        var setX = Set<Int>()
        var setY = Set<Int>()
        for point in pointArray {
            setX.insert(point.x)
            setY.insert(point.y)
        }
        if setX.count==2 && setY.count==2 { return true }
        else { return false }
    }
    
    func area() -> Double {
        let leftBottom = MyPoint(x: leftTop.x, y: rightBottom.y)
        let bottomLine = MyLine(pointA: leftBottom , pointB: rightBottom).distance()
        let height = MyLine(pointA: leftBottom, pointB: leftTop).distance()
        return bottomLine * height
    }
}

extension MyRect: Figure {
    func calculator() -> (String, Double)? {
        return ("사각형 넓이는 ", area())
    }
}
