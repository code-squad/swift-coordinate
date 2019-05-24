//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 24..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: Shape {
    private let leftTop: MyPoint
    private let rightBottom: MyPoint
    private(set) var points: [MyPoint]
    
    init?(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint, pointD: MyPoint) {
        guard (pointA.x < pointB.x && pointA.y == pointB.y)
            || (pointB.y < pointD.y && pointB.x == pointD.x)
            || (pointB.x == pointC.x && pointD.y == pointC.y) else {
            return nil
        }
        self.leftTop = pointD
        self.rightBottom = pointB
        self.points = [pointA, pointB, pointC, pointD]
    }
    
    init?(origin: MyPoint, size: CGSize) {
        let width = Int(size.width)
        let height = Int(size.height)
        guard width > 0 || height > 0 else {
            return nil
        }
        self.leftTop = MyPoint(x: origin.x, y: origin.y + height)
        self.rightBottom = MyPoint(x: origin.x + width, y: origin.y)
        let rightTop = MyPoint(x: origin.x + width, y: origin.y + height)
        self.points = [origin, self.rightBottom, rightTop, self.leftTop]
    }
    
}
