//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 14..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: Figure, FigureCalculatable {
    
    var myPoints: [MyPoint]
    var leftTop = MyPoint()
    var rightBottom = MyPoint()
    
    init(_ myPoints: [MyPoint]) {
        self.myPoints = myPoints
    }
    
    func calculateDistance() -> Double {
        let width = self.rightBottom.x - self.leftTop.x
        let height = self.leftTop.y - self.rightBottom.y
        
        return Double(width * height)
    }
}

extension MyRect: DistancePrintable {
    var prefixText: String {
        return "사각형 넓이는"
    }
}
