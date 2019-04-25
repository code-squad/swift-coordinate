//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/25/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: Figure, Ment {
    private(set) var leftTop = MyPoint()
    private(set) var rightBottom = MyPoint()
    private(set) var area = 0.0
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.x + Int(size.height))
        self.area = Double(size.width * size.height)
    }
    
    func draw() -> [MyPoint] {
        return [leftTop, MyPoint(x: leftTop.x, y: rightBottom.y), MyPoint(x: rightBottom.x, y: leftTop.y), rightBottom]
    }
    
    func getMent() -> [String: Double] {
        return ["사각형 넓이는": area]
    }
}
