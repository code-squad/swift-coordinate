//
//  MyLine+.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
import Foundation

extension MyLine: LineProtocol {

    func getPoints() -> [MyPoint] {
        return [self.pointA, self.pointB]
    }
    
    func getDistance() -> Double {
        let differenceX = pow(Decimal(self.pointA.x-self.pointB.x), 2)
        let differenceY = pow(Decimal(self.pointA.y-self.pointB.y), 2)
        let sum: Double = NSDecimalNumber(decimal: differenceX + differenceY).doubleValue
        return sqrt(sum)
    }
}
