//
//  FigureMaker.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 7..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory: Figurable {
    
    private var myPoints: [MyPoint]
    
    init(_ myPoints: [MyPoint]) {
        self.myPoints = myPoints
    }
    
    func makeFigure() {
        switch self.myPoints.count {
        case 1:
            //makeMyPoint()
        case 2:
            //makeMyLine()
        default:
            makeMyPoint()
        }
    }
}

protocol Figurable {
    func calculate() -> Double
}
