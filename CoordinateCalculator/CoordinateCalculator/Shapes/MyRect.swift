//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 24..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: Shape, Measurable {
    private let leftTop: MyPoint
    private let rightBottom: MyPoint
    private(set) var points: [MyPoint]
    private(set) var area: Double
    
    init?(origin: MyPoint, size: CGSize) {
        let width = Int(size.width)
        let height = Int(size.height)
        guard let leftTop = MyPoint(x: origin.x, y: origin.y + height),
            let rightBottom = MyPoint(x: origin.x + width, y: origin.y),
            let rightTop = MyPoint(x: origin.x + width, y: origin.y + height),
            width > 0 || height > 0 else {
                return nil
        }
        self.leftTop = leftTop
        self.rightBottom = rightBottom
        self.points = [origin, leftTop, rightBottom, rightTop]
        self.area = Double(width * height)
    }
    
    func areaDescription() -> String {
        return "사각형 넓이는 \(area) 입니다."
    }
}
