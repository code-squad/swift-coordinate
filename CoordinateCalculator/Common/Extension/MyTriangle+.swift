//
//  MyTriangle+.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 15..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

extension MyTriangle: FigureProtocol {
    
    func getPoints() -> [MyPoint] {
        return [self.lineAB.pointA,
                self.lineAB.pointB,
                self.lineBC.pointA,
                self.lineBC.pointB,
                self.lineAC.pointA,
                self.lineAC.pointB ]
    }
    
    func figureCalculation() -> Double {
        let a = self.lineBC.figureCalculation()
        let b = self.lineAC.figureCalculation()
        let c = self.lineAB.figureCalculation()
        
        let cosB = (a^2 + c^2 - b^2) / (2 * a * c)
        let sinB = sqrt(1 - cosB * cosB)
        let s = a * c * sinB / 2
        
        return s
    }
    
    var description: String {
        return "삼각형 넓이는 "
    }
}
