//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 9..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    var leftTop = MyPoint()
    var rightBottom = MyPoint()
    var origin = MyPoint()
    var size: CGSize
    
    // 입력받은값 4개의 점으로 원점과 밑변과 높이를 구하기위해 필요한 함수...Rect
    static func calculateOriginOfRectAndSize(_ coordinateModel: CoordinateModel) -> (points: MyPoint, size: CGSize) {
        var origin = MyPoint()
        var size: CGSize = CGSize.zero
        origin.x = (coordinateModel[1].x - coordinateModel[0].x) + coordinateModel[0].x
        origin.y = (coordinateModel[3].y - coordinateModel[0].y) + coordinateModel[0].y
        size.width = CGFloat(coordinateModel[1].x - coordinateModel[0].x)
        size.height = CGFloat(coordinateModel[3].y - coordinateModel[0].y)
        return (origin, size)
    }
    
    init(origin: MyPoint, size: CGSize) {
        self.origin = origin
        self.size = size
        // 원점으로 양끝난 구하기... leftTop, rightBottom
        self.rightBottom.x = 2 * (origin.x - Int(size.width)) + Int(size.width)
        self.leftTop.y = 2 * (origin.y - Int(size.height) + Int(size.height))
        self.leftTop.x = self.rightBottom.x - Int(size.width)
        self.rightBottom.y = self.leftTop.y - Int(size.height)
    }
    
    func calculateRectArea() -> Double {
        return Double(size.width * size.height)
    }
}
