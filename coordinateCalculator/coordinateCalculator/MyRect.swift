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
    var size: CGSize
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.size = size
    }
    
    var point: [MyPoint] {
        let rightBottomX = leftTop.x + Int(size.width)
        let rightBottomY = leftTop.y + Int(size.height)
        return [leftTop,MyPoint(x: rightBottomX, y: leftTop.y),MyPoint(x: leftTop.x, y: rightBottomY),MyPoint(x: rightBottomX, y: rightBottomY)]
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
