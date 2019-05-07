//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 03/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    var leftTop = MyPoint()
    var rightBottom = MyPoint()
    var size = CGSize()
    
    init(leftTop: MyPoint, rightBottom: MyPoint) {
        self.leftTop = leftTop
        self.rightBottom = rightBottom
        let width = rightBottom.x - leftTop.x
        let height = leftTop.y - rightBottom.y
        size = CGSize(width: width, height: height)
    }
    
    init(origin: MyPoint, size: CGSize) {
        self.size = size
        let leftTopY = origin.y + Int(size.height)
        let rightBottomX = origin.x + Int(size.width)
        leftTop = MyPoint(x: origin.x, y: leftTopY)
        rightBottom = MyPoint(x: rightBottomX, y: origin.y)
    }
}
