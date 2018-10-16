//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 16/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: CalculableShape {
    private var leftTop = MyPoint(x: 0, y: 0)
    private var rightBottom = MyPoint(x: 0, y: 0)
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: leftTop.x + Int(size.width), y: leftTop.y - Int(size.height))
    }
    
    var points: [MyPoint] {
        return [leftTop, MyPoint(x: leftTop.x, y: rightBottom.y), rightBottom, MyPoint(x: rightBottom.x, y: leftTop.y)]
    }
    
    var calculationMessage: String {
        return "사각형의 넓이는"
    }
    
    func calculate() -> Double {
        let width = rightBottom.x - leftTop.x
        let height = leftTop.y - rightBottom.y
        return Double(width * height)
    }
}
