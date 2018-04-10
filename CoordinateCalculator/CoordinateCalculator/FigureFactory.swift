//
//  FigureMaker.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 7..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum FigureType: Int {
    case line = 2
}

struct FigureFactory {
    
    private var myPoints: [MyPoint]
    
    init(_ myPoints: [MyPoint]) {
        self.myPoints = myPoints
    }
    
    func makeFigure() -> Figure {
        switch self.myPoints.count {
        case FigureType.line.rawValue:
            return MyLine(self.myPoints)
        default:
            return MyPoint(x: myPoints[0].x, y: myPoints[0].y)
        }
    }
}
