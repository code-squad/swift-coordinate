//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 24..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    private let leftTop: MyPoint
    private let rightBottom: MyPoint
    
    init?(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint, pointD: MyPoint) {
        guard pointA.y == pointB.y || pointB.x == pointC.x || pointC.y == pointD.y || pointD.x == pointA.x else {
            return nil
        }
        self.leftTop = pointD
        self.rightBottom = pointB
    }
    
    init?(origin: MyPoint, size: CGSize) {
        guard size.width > 0 || size.height > 0 else {
            return nil
        }
        self.leftTop = MyPoint(x: origin.x, y: origin.y + Int(size.height))
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y)
    }
}
