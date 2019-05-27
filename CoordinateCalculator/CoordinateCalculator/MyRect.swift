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
    private let area: Double
    
    init(origin: MyPoint, size: CGSize) {
        let width = Int(size.width)
        let height = Int(size.height)
        let leftBottom = MyPoint(x: origin.x, y: origin.y)
        let leftTop = MyPoint(x: origin.x, y: origin.y + Int(size.height))
        let rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y)
        let rightTop = MyPoint(x: origin.x + Int(size.width), y: origin.y + Int(size.height))
        self.area = Double(width * height)
        self.points = [leftBottom,rightBottom,rightTop,leftTop]
    }
    
    var explanation: String {
        return ExplanationType.rectangle.rawValue
            +  ": \(area)"
    }
}






