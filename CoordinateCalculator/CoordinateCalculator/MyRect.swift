//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 02/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: Drawable, Measurable {
    private(set) var leftTop: MyPoint
    private(set) var rightBottom: MyPoint
    
    func point() -> [MyPoint] {
        let leftBottom = MyPoint(x: leftTop.x, y: rightBottom.y)
        let rightTop = MyPoint(x: rightBottom.x, y: leftTop.y)
        
        return [leftBottom, leftTop, rightBottom, rightTop]
    }
    
    var shapeState: ShapeStatePhrase {
        return .rect
    }
    
    var measuredValue: Double {
        let width = rightBottom.x - leftTop.x
        let height = leftTop.y - rightBottom.y
        
        return Double(width * height)
    }
    
    init(origin: MyPoint, size: CGSize) {
        leftTop = MyPoint(x: origin.x, y: origin.y + Int(size.height))
        rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y)
    }
}
