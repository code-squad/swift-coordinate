//
//  MyLine+.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
import Foundation

extension MyLine: FigureProtocol {

    func getPoints() -> [MyPoint] {
        return [self.pointA, self.pointB]
    }
    
    func figureCalculation() -> Double {
        let differenceX = Double(self.pointA.x-self.pointB.x)^2
        let differenceY = Double(self.pointA.y-self.pointB.y)^2
        let sum: Double = differenceX + differenceY
        return sqrt(sum)
    }
    
    var description: String {
        return "두 점 사이 거리는 : "
    }
}
