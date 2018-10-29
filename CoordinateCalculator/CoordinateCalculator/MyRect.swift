//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 18. 10. 29..
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect : CalculatedFigure {
    private let leftTop : MyPoint
    private let rightBottom : MyPoint
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint.init(x: origin.readX() + Int(size.width),
                                        y: origin.readY() - Int(size.height))
    }
    
    func calculateMent() -> String {
        return "사각형 넓이는 "
    }
    
    func calculate() -> Double {
        let width = rightBottom.readX() - leftTop.readX()
        let height = leftTop.readY() - rightBottom.readY()
        return Double(width * height)
    }
    
    func readPoints() -> [MyPoint] {
        return [leftTop,
                rightBottom,
                MyPoint(x: leftTop.readX(), y: rightBottom.readY()),
                MyPoint(x: rightBottom.readX(), y: leftTop.readY())]
    }
}
