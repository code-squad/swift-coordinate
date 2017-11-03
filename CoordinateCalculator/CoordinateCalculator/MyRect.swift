//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect : Figure {
    private(set) var leftTop : MyPoint
    private(set) var rightBottom : MyPoint
    private(set) var size : CGSize
    private(set) var points: [MyPoint]
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint.init(x: (origin.x + Int(size.width)), y: (origin.y - Int(size.height)))
        self.size = size
        let rightTop = MyPoint.init(x: (origin.x + Int(size.width)), y: origin.y)
        let leftBottom = MyPoint.init(x: origin.x, y: (origin.y - Int(size.height)))
        self.points = [self.leftTop, rightTop, self.rightBottom, leftBottom]
    }
    
    func getArea() -> Int {
        return Int(size.width) * Int(size.height)
    }
}
