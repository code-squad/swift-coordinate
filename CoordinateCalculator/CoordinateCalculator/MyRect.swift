//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by JH on 31/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: DrawableShape, SimplyDescribable {
    
    private (set) var leftTop: MyPoint
    private (set) var rightBottom: MyPoint

    init(origin: MyPoint, size: CGSize) {
        self.leftTop = MyPoint(x: origin.x, y: origin.y)
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y - Int(size.height))
    }
    
    var drawablePoints: [MyPoint] {
        return [leftTop, rightBottom, MyPoint(x: leftTop.x, y: rightBottom.y), MyPoint(x: rightBottom.x, y: leftTop.y)]
    }

    var area: Int {
        return (rightBottom.x - leftTop.x)*(leftTop.y - rightBottom.y)
    }
    
    var simpleDescription: String {
        return "사각형 넓이는 \(area)"
    }

}
