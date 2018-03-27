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
    private var size:CGSize
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.size = size
    }
    
    init(points:[MyPoint]){
        let width = points[2].x - points[0].x
        let height = points[1].y - points[0].y
        let origin = MyPoint(points[0].x, points[0].y)
        self.init(origin: origin, size: CGSize(width: width, height: height))
        self.points = points
    }
    
    func result() -> String {
        return "사격형의 넓이는 \(calculateResult())"
    }
    
    private func calculateResult() -> Double {
        return Double(size.width * size.height)
    }
}
