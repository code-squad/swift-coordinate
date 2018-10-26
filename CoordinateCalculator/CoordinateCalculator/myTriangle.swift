//
//  myTriangle.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 25/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

// 세 좌표를 받아와서 넓이를 계산하고 좌표 정보를 전달해주는 일을 책임지는 구조체
struct MyTriangle: ComputableFigure {
    private var lineAB: MyLine
    private var lineBC: MyLine
    private var lineCA: MyLine
    
    init (pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineCA = MyLine(pointA: pointC, pointB: pointA)
    }
    
    public var points: [MyPoint] {
        let pointA = self.lineAB.firstPoint()
        let pointB = self.lineBC.firstPoint()
        let pointC = self.lineCA.firstPoint()
        
        return [pointA, pointB, pointC]
    }
    
    private func findCosB(_ a: Double, _ b: Double, _ c: Double) -> Double{
        let squareA = a * a
        let squareB = b * b
        let squareC = c * c

        return (squareA + squareC - squareB) / (2 * a * c)
    }
    
    private func findSinB(_ cosB: Double) -> Double {
        return (1 - (cosB * cosB)).squareRoot()
    }
    
    // 넓이를 계산하는 메소드
    public func compute() -> Double {
        let a = lineBC.compute()
        let b = lineCA.compute()
        let c = lineAB.compute()
        
        let cosB = findCosB(a, b, c)
        let sinB = findSinB(cosB)
        
        return round(((a * c * sinB) / 2)*1000) / 1000
    }
    
    public func computeMent() -> String {
        return "삼각형의 넓이는 : "
    }
}
