//
//  myRect.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect : ComputableFigure {
    private var leftTop : MyPoint
    private let size : CGSize
    
    init(origin: MyPoint, size: CGSize) {
        self.size = size
        self.leftTop = origin
    }
    
    public var points: [MyPoint] {
        let width = Int(size.width), height = Int(size.height)
        let x = leftTop.xPoint(), y = leftTop.yPoint()
        let rightTop = MyPoint(x: x + width, y: y)
        let leftBottom = MyPoint(x: x, y: y - height)
        let rightBottom = MyPoint(x: x + width, y: y - height)
        
        return [leftTop, rightTop, rightBottom, leftBottom]
    }
    
    public func compute() -> Double {
        if (size.width * size.height) < 0 {
            return -Double(size.width * size.height)
        }
        return Double(size.width * size.height)
    }
    
    public func computeMent() -> String {
        return "사각형의 넓이는 : "
    }
}
