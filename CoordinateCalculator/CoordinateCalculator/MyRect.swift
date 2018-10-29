//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 18. 10. 29..
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect : CalculatedFigure {
    private let leftTop : MyPoint
    private let rightBottom : MyPoint
    
    func calculateMent() -> String {
        return "사각형 넓이는 "
    }
    
    func calculate() -> Double {
        
        return 0
    }
    
    func readPoints() -> [MyPoint] {
        
        return [MyPoint(x: 1, y: 1)]
    }
}
