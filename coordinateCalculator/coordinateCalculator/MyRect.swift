//
//  MyRect.swift
//  coordinateCalculator
//
//  Created by JINA on 20/12/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

struct MyRect: Figure, calculation {
    var leftTop = MyPoint(x: 0, y: 0)
    var rightBottom = MyPoint(x: 0, y: 0)
    var size: CGSize
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.size = size
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y + Int(size.height))
    }
    
    var point: [MyPoint] {
        return [leftTop,MyPoint(x: rightBottom.x, y: leftTop.y),MyPoint(x: leftTop.x, y: rightBottom.y),rightBottom]
    }
    
    func calculate() -> Double {
        let rectSize = Double(size.width * size.height)
        if rectSize < 0 {
            return rectSize * -1
        }
        return rectSize
    }
    
    func calculateMent() -> String {
        return "사각형의 넓이 : "
    }
}
