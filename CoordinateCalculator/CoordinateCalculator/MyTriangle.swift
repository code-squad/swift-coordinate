//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 26/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

extension Double {
    func squared() -> Double {
        return self * self
    }
}

struct MyTriangle : Figure {
    private let lineAB : MyLine
    private let lineBC : MyLine
    private let lineAC : MyLine
    
    private let pointA : MyPoint
    private let pointB : MyPoint
    private let pointC : MyPoint
    
    init(_ pointA: MyPoint, _ pointB: MyPoint, _ pointC: MyPoint) {
        self.lineAB = .init(pointA, pointB)
        self.lineBC = .init(pointB, pointC)
        self.lineAC = .init(pointA, pointC)
        
        self.pointA = pointA
        self.pointB = pointB
        self.pointC = pointC
    }
    
    func triangleWidth() -> Double {
        let a = self.lineBC.distanceBetween()
        let c = self.lineAB.distanceBetween()
        
        return 1 / 2 * a * c * sinB()
    }
    
    private func sinB() -> Double {
        return (1 - cosB().squared()).squareRoot()
    }
    
    private func cosB() -> Double {
        let a = self.lineBC.distanceBetween()
        let b = self.lineAC.distanceBetween()
        let c = self.lineAB.distanceBetween()
        
        return (a.squared() + c.squared() - b.squared()) / 2 * a * c
    }
    
    func readPoints() -> [MyPoint] {
        return [self.pointA, self.pointB, self.pointC]
    }
}
