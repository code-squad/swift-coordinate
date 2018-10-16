//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 16/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: CalculableShape {
    private var leftTop = MyPoint(x: 0, y: 0)
    private var rightBottom = MyPoint(x: 0, y: 0)
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: leftTop.x + Int(size.width), y: leftTop.y - Int(size.height))
    }
    
    private func sortXbyASC(first: MyPoint, second: MyPoint) -> Bool {
        return first.x < second.x
    }
    
    init(points: [MyPoint]) {
        guard points.count == 4 else { return }
        var points = points
        points.sort(by: sortXbyASC)
        self.leftTop = points[0].y < points[1].y ? points[1] : points[0]
        self.rightBottom = points[2].y < points[3].y ? points[2] : points[3]
    }
    
    var points: [MyPoint] {
        return [leftTop, MyPoint(x: leftTop.x, y: rightBottom.y), rightBottom, MyPoint(x: rightBottom.x, y: leftTop.y)]
    }
    
    var calculationMessage: String {
        return "사각형의 넓이는"
    }
    
    func calculate() -> Double {
        let width = rightBottom.x - leftTop.x
        let height = leftTop.y - rightBottom.y
        return Double(width * height)
    }
}
