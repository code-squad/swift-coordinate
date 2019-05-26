//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 24/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: Drawable, Explanation {
    private(set) var points: [MyPoint]
    private let leftTop: MyPoint
    private let rightBottom: MyPoint
    private let rightTop: MyPoint
    private let leftBottom: MyPoint
    private let area: Double
    
    init(_ origin: MyPoint, _ size: CGSize) {
        let width = Int(size.width)
        let height = Int(size.height)
        self.leftBottom = MyPoint(x: origin.x, y: origin.y)
        self.leftTop = MyPoint(x: origin.x, y: origin.y + Int(size.height))
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y)
        self.rightTop = MyPoint(x: origin.x + Int(size.width), y: origin.y + Int(size.height))
        self.area = Double(width * height)
        self.points = [leftBottom,rightBottom,rightTop,leftTop]
    }
    
    var explanation: String {
        return ExplanationType.rectangle.rawValue
            +  ": \(area)"
    }
}






