//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    
    private(set) var lineAB: MyLine
    private(set) var lineBC: MyLine
    private(set) var lineAC: MyLine
        
    init() {
        lineAB = MyLine()
        lineBC = MyLine()
        lineAC = MyLine()
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        //로직 구현
        lineAB = MyLine(pointA: pointA, pointB: pointB)
        lineBC = MyLine(pointA: pointB, pointB: pointC)
        lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
}

// MARK: Methods
extension MyTriangle {
    
    static func isTriangle(_ pointArray: [MyPoint]) -> Bool {
        let a = MyLine(pointA: pointArray[0], pointB: pointArray[1]).distance()
        let b = MyLine(pointA: pointArray[0], pointB: pointArray[2]).distance()
        let c = MyLine(pointA: pointArray[1], pointB: pointArray[2]).distance()
        let arr: [Double] = [a,b,c].sorted()
        if arr[0]+arr[1] > arr[2] { return true }
        else { return false }
    }
    
    func areaTriangle() -> Double {
        let a = lineAB.distance()
        let b = lineBC.distance()
        let c = lineAC.distance()
        let cos = ( pow(a, 2.0) + pow(b, 2.0) - pow(c, 2.0) ) / (2.0 * a * b)
        let sin = sqrt(1.0 - pow(cos, 2.0))
        var area = (a * b * sin) / 2
        return area.roundToPlaces(places: 1)
    }
}
