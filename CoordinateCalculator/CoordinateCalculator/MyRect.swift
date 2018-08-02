//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by oingbong on 2018. 7. 31..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect:ShapeProtocol,BasicProtocol,Equatable {
    
    private var leftTop = MyPoint()
    private var rightBottom = MyPoint()
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        let width = size.width
        let height = size.height
        let valueX = Int(width) + origin.valueX
        let valueY = Int(height) + origin.valueY
        self.rightBottom = MyPoint.init(x: valueX , y: valueY)
    }
    
    init(points: [MyPoint]) {
        let coordinate = MyRect.classifyCoordinates(points: points)
        
        if let minX = coordinate.0.min() , let minY = coordinate.1.min() {
            self.leftTop.valueX = minX
            self.leftTop.valueY = minY
        }
        if let maxX = coordinate.0.max() , let maxY = coordinate.1.max() {
            self.rightBottom.valueX = maxX
            self.rightBottom.valueY = maxY
        }
    }
    
    public func calculate() -> Double {
        let width = self.rightBottom.valueX - self.leftTop.valueX
        let height = self.rightBottom.valueY - self.leftTop.valueY
        let area = width * height
        return Double(area)
    }

    public func message() -> String {
        return "사각형 넓이는 "
    }
    
    public static func isQuadrangle(elements:[MyPoint]) -> Bool {
        let coordinate = classifyCoordinates(points: elements)

        // 직사각형 여부 확인
        guard coordinate.0.count == 2 && coordinate.1.count == 2 else {
            print("직사각형이 아닙니다.")
            return false
        }
        
        return true
    }
    
    // 좌표 분류
    private static func classifyCoordinates(points:[MyPoint]) -> (Set<Int> , Set<Int>) {
        var setX = Set<Int>()
        var setY = Set<Int>()
        
        for point in points {
            setX.insert(point.valueX)
            setY.insert(point.valueY)
        }
        
        return ( setX , setY )
    }
    
}
