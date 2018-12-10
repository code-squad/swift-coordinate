//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by Elena on 07/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: FigureProtocol , DistanceProtocol{
    
    private var leadingTop = MyPoint(x: 0, y: 0)
    private var trailingBottom = MyPoint(x: 0, y: 0)
    
    init(origin: MyPoint, size: CGSize) {
        self.leadingTop = origin
        self.trailingBottom = MyPoint(x: leadingTop.x + Int(size.width), y: leadingTop.y - Int(size.height))
    }
    
    init(points: [MyPoint]) {
        guard rectValidator(points) else {
            return
        }
        let points = points.sorted(by: {$0.x < $1.x})
        self.leadingTop = points[0].y < points[1].y ? points[1] : points[0]
        self.trailingBottom = points[2].y < points[3].y ? points[2] : points[3]
    }
    
    var points: [MyPoint] {
        return [leadingTop, MyPoint(x: leadingTop.x, y: trailingBottom.y), trailingBottom, MyPoint(x: trailingBottom.x, y: leadingTop.y)]
    }
    
    var descriptionTwoPoint: String {
        return "사각형의 넓이는"
    }
    
    var valueOfPoint: Double {
        let width = trailingBottom.x - leadingTop.x
        let height = leadingTop.y - trailingBottom.y
        return Double(width * height)
    }
    
    
    
    func rectValidator(_ points: [MyPoint]) -> Bool {
        let point = points[0]
        
        guard let sameXPoint = (points.filter {$0.x == point.x && $0.y != point.y}).first else { return false }
        guard let sameYPoint = (points.filter {$0.x != point.x && $0.y == point.y}).first else { return false }
        guard let otherPoint = (points.filter {$0.x != point.x && $0.y != point.y}).first else { return false }
        return otherPoint.x == sameYPoint.x && otherPoint.y == sameXPoint.y
    }
}
