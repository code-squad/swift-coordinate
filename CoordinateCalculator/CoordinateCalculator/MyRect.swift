//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 26..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
struct MyRect: Shape, Resultable {
    private(set) var points: [MyPoint] = []
    private var leftTop: MyPoint
    private var rightTop: MyPoint
    private var leftBottom: MyPoint
    private var rightBottom: MyPoint
    private var size:CGSize
    
    init(origin: MyPoint, size: CGSize) {
        self.size = size
        self.leftTop = origin
        self.rightTop = MyPoint(leftTop.x + Int(size.width), leftTop.y)
        self.leftBottom = MyPoint(leftTop.x, leftTop.y - Int(size.height))
        self.rightBottom = MyPoint(leftTop.x + Int(size.width), leftTop.y - Int(size.height))
        points = [leftTop, rightTop, leftBottom, rightBottom]
    }
    
    func result() -> String {
        return "사격형의 넓이는 \(calculateResult())"
    }
    
    private func calculateResult() -> Double {
        return Double(size.width * size.height)
    }
}
