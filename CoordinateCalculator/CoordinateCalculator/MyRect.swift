//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by oingbong on 2018. 7. 31..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect:ShapeProtocol {
    
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
    
    public func calculate() -> Double? {
        let width = self.rightBottom.valueX - self.leftTop.valueX
        let height = self.rightBottom.valueY - self.leftTop.valueY
        let area = width * height
        return Double(area)
    }

    public func message() -> String {
        return "사각형 넓이는 "
    }
    
    public static func isQuadrangle(elements:[MyPoint]) -> Bool {
        var setX = Set<Int>()
        var setY = Set<Int>()
        
        for element in elements {
            setX.insert(element.valueX)
            setY.insert(element.valueY)
        }
        
        // 직사각형 여부 확인
        guard setX.count == 2 && setY.count == 2 else {
            print("직사각형이 아닙니다.")
            return false
        }
        
        return true
    }
    
}
