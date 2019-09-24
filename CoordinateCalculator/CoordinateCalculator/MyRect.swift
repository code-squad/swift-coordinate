//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by jake.you on 2019/09/24.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    private(set) var leftTop = MyPoint()
    private(set) var rightBottom = MyPoint()
    
    private var leftBottom: MyPoint {
        return MyPoint(x: leftTop.x, y: rightBottom.y)
    }
    
    private var rightTop: MyPoint {
        return MyPoint(x: rightBottom.x , y: leftTop.y)
    }

    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        let rightBottomX = origin.x + Int(size.width)
        let rightBottomY = origin.y - Int(size.height)
        self.rightBottom = MyPoint(x: rightBottomX, y: rightBottomY)
    }
    
    init(points: [MyPoint]) {
        var sorted = points.sorted { $0.x < $1.x }
        var leftPoints = [sorted[0], sorted[1]].sorted { $0.y > $1.y }
        var rightPoints = [sorted[2], sorted[3]].sorted { $0.y > $1.y }

        self.leftTop = leftPoints[0]
        self.rightBottom = rightPoints[1]
    }
}

extension MyRect: Shape {
    var vertices: [CoordinatePresentable] {
        return [leftTop, rightTop, leftBottom, rightBottom]
    }
    
    func extent() -> Double {
        return MyLine(x: leftTop, y: rightTop).distance() * MyLine(x: leftTop, y: leftBottom).distance()
    }
}


