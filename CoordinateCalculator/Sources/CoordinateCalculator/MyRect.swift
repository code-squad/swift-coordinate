//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 11. 1..
//

import Foundation

struct MyRect{
    private(set) var leftTop = MyPoint()
    private(set) var rightBottom = MyPoint()
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y - Int(size.height))
    }
}

extension MyRect: FigureCalculatable{
    func getPoints() -> [MyPoint] {
        return []
    }
    
    func calculate() -> Double {
        let width = self.rightBottom.x - self.leftTop.x
        let height = self.leftTop.y - self.rightBottom.y
        return Double(width * height)
    }
}
