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

extension MyRect: AxisDrawable {
    var points: [MyPoint] {
        var points = [leftTop, rightBottom]
        points.append(MyPoint(x: leftTop.x, y: rightBottom.y))
        points.append(MyPoint(x: rightBottom.x, y: leftTop.y))
        return points
    }
}

extension MyRect: ValueComputable {
    var description: String {
        return "사각형 넓이는 "
    }
    
    func getComputedValue() -> Double {
        let area = size.width * size.height
        return Double(area)
    }
}
