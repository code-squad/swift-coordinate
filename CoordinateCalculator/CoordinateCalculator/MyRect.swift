//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    var leftTop = MyPoint(x: 0, y: 0)
    var rightBottom = MyPoint(x: 0, y: 0)
    var rightTop = MyPoint(x: 0, y: 0)
    var leftBottom = MyPoint(x: 0, y: 0)
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y + Int(size.height))
        self.rightTop = MyPoint(x: self.rightBottom.x, y: self.leftTop.y)
        self.leftBottom = MyPoint(x: self.leftTop.x, y: self.rightBottom.y)
    }
    
    init(_ points: [MyPoint]) {
        self.leftTop = points[0]
        self.rightTop = points[1]
        self.leftBottom = points[2]
        self.rightBottom = points[3]
    }

}
