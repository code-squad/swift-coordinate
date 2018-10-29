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
    private var rightTop : MyPoint
    private var leftBottom : MyPoint
    private var rightBottom : MyPoint
    private let size : CGSize
    
    init(origin: MyPoint, size: CGSize) {
        let width = Int(size.width), height = Int(size.height)
        let x = origin.xPoint(), y = origin.yPoint()

        self.size = size
        self.leftTop = origin
        self.rightTop = MyPoint(x: x + width, y: y)
        self.leftBottom = MyPoint(x: x, y: y - height)
        self.rightBottom = MyPoint(x: x + width, y: y - height)
    }
    
    public var points: [MyPoint] {
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
