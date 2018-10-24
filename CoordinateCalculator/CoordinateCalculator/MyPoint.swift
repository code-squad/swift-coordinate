//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : Shape{
    private(set) var xPosition : Double
    private(set) var yPosition : Double
    
    init(_ xPosition: Double, _ yPosition: Double) {
        self.xPosition = xPosition
        self.yPosition = yPosition
    }
}
