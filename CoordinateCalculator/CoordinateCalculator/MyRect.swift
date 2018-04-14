//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 14..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: Figure, FigureCalculatable {
    
    private var leftTop = MyPoint()
    private var rightBottom = MyPoint()
    
    var myPoints: [MyPoint] {
        let rightTop = MyPoint(x: self.rightBottom.x, y: self.leftTop.y)
        let leftBottom = MyPoint(x: self.leftTop.x, y: self.rightBottom.y)
        
        return [self.leftTop, rightTop, leftBottom, self.rightBottom]
    }
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y - Int(size.height))
    }
    
    func calculateDistance() -> Double {
        let width = self.rightBottom.x - self.leftTop.x
        let height = self.leftTop.y - self.rightBottom.y
        
        return Double(width * height)
    }
}

extension MyRect: DistancePrintable {
    var prefixText: String {
        return "사각형 넓이는"
    }
}
