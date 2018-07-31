//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 31/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: Over1DFigureProtocol {
    private var leftTop: MyPoint
    private var rightBottom: MyPoint
    private var size: CGSize
    
    var descriptionPrefix: String {
        return "사각형의 넓이는"
    }
    
    var valueOfFigure: Double {
        return Double(size.width * size.height)
    }
    
    var points: [MyPoint] {
        let rightTop = MyPoint(x: leftTop.x + Int(size.width), y: leftTop.y)
        let leftBottom = MyPoint(x: leftTop.x, y: leftTop.y - Int(size.height))
        return [leftTop, rightTop, leftBottom, rightBottom]
    }
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: leftTop.x + Int(size.width), y: leftTop.y - Int(size.height))
        self.size = size
    }
}
