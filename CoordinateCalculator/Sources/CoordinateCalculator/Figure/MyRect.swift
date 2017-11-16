//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 14..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    private(set) var leftTop = MyPoint()        // Min X, Max Y
    private(set) var rightBottom = MyPoint()    // Max X, Min Y
    private(set) var origin = MyPoint()
    private(set) var size = CGSize(width: 0, height: 0)
}

extension MyRect: Figurable {
    init(points: [MyPoint]) {
        self.init(origin: points[0], size: CGSize(width: CGFloat(points[2].x) - CGFloat(points[0].x), height: CGFloat(points[1].y) - CGFloat(points[0].y)))
        self.leftTop = points[1]
        self.rightBottom = points[2]
    }
    
    init(origin: MyPoint, size: CGSize) {
        self.origin = origin
        self.size = size
    }
    
    func calculate() -> Double {
        return calculateArea()
    }
    
    private func calculateArea() -> Double {
        return Double(size.width) * Double(size.height)
    }
    
    var points: [MyPoint] {
        return [MyPoint(x: leftTop.x, y: rightBottom.y), leftTop, rightBottom, MyPoint(x: rightBottom.x, y: leftTop.y)]
    }
    
    func messageToCalculate() -> String {
        return "사각형의 넓이는 "
    }
}

