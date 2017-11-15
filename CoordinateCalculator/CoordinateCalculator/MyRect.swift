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
        <#code#>
    }
    
    func resultOfMyShape() -> Double {
        <#code#>
    }
    
    var resultDescription: String = {
        return "사각형의 넓이는 "
    }()
}
