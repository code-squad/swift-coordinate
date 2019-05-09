//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 09/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: Drawable {
    
    private let leftTop: MyPoint
    private let rightBottom: MyPoint
    
    var points: [MyPoint] {
        return [
            leftTop,
            rightBottom,
            MyPoint(x: leftTop.x, y: rightBottom.y),
            MyPoint(x: rightBottom.x, y: leftTop.y)
        ]
    }
    
    var area: Double {
        let width = rightBottom.x - leftTop.x
        let height = leftTop.y - rightBottom.y
        
        let result = Double(width * height)
        
        return result
    }
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        let rightX = origin.x + Int(size.width)
        let rightY = origin.y - Int(size.height)
        self.rightBottom = MyPoint(x: rightX, y: rightY)
    }
}

extension MyRect: Calculable {
    
    var description: String {
        return "사각형의 넓이는"
    }
    
    func getCalcultedValue() -> Double {
        return area
    }
}
