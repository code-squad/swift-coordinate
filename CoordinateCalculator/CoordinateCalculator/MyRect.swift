//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 15..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: MyShape, MyDescription {   
    var leftTop = MyPoint(x: 0, y: 0)
    var rightBottom = MyPoint(x: 0, y: 0)
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y + Int(size.height))
    }
    
    func calculateOfPosition() -> [MyPoint] {
        return [leftTop, MyPoint(x: leftTop.x, y: rightBottom.y), rightBottom, MyPoint(x: rightBottom.x, y: leftTop.y)]
    }
    
    func calculateOfArea() -> Double {
        let height = MyLine(pointA: leftTop, pointB: MyPoint(x: leftTop.x, y: rightBottom.y)).calculateOfLength()
        let width = MyLine(pointA: MyPoint(x: leftTop.x, y: rightBottom.y), pointB: rightBottom).calculateOfLength()
        return height * width
    }
    
    func resultOfMyShape() -> Double {
        return calculateOfArea()
    }
    
    var resultDescription: String = {
        return "사각형의 넓이는 "
    }()
}
