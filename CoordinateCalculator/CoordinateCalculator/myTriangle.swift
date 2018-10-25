//
//  myTriangle.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 25/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

// 세 좌표를 받아와서 넓이를 계산하고 좌표 정보를 전달해주는 일을 책임지는 구조체
struct MyTriangle: Figure {
    private var lineAB = MyLine(pointA: MyPoint(x: Int(), y: Int()), pointB: MyPoint(x: Int(), y: Int()))
    private var lineBC = MyLine(pointA: MyPoint(x: Int(), y: Int()), pointB: MyPoint(x: Int(), y: Int()))
    private var lineCA = MyLine(pointA: MyPoint(x: Int(), y: Int()), pointB: MyPoint(x: Int(), y: Int()))
    
    init (pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB.pointA = pointA
        self.lineAB.pointB = pointB
        self.lineBC.pointA = pointB
        self.lineBC.pointB = pointC
        self.lineCA.pointA = pointC
        self.lineCA.pointB = pointA
    }
    
    public var points: [MyPoint] {
        return [lineAB.pointA, lineBC.pointA, lineCA.pointA]
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
    public func calcTriangleWidth() -> Double {
        let a = lineBC.calculateDistance()
        let b = lineCA.calculateDistance()
        let c = lineAB.calculateDistance()
        
        let cosB = findCosB(a, b, c)
        let sinB = findSinB(cosB)
        
        return round(((a * c * sinB) / 2)*1000) / 1000
    }
}
