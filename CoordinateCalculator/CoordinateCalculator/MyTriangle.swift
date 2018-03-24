//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 24..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Shape, Resultable{
    private(set) var points: [MyPoint]
    private var lineAB:MyLine
    private var lineBC:MyLine
    private var lineAC:MyLine
    
    init(pointFirst:MyPoint, pointSecond:MyPoint, pointThird:MyPoint){
        self.lineAB = MyLine(pointFirst: pointFirst, pointSecond: pointSecond)
        self.lineBC = MyLine(pointFirst: pointSecond, pointSecond: pointThird)
        self.lineAC = MyLine(pointFirst: pointFirst, pointSecond: pointThird)
        self.points = [pointFirst, pointSecond, pointFirst]
    }
    func result() -> String {
        return "삼각형의 넓이는  \(calculateResult())"
    }
    
    // 세 점으로 삼각형 넓이 구해야 함.
    
    // (a,b)(c,d)(e,f)
    // 0.5 * abs( ad + cf + eb - af - ed- cb )
    
    // (x1,y1)(x2,y2)(x3,y3)
    // 0.5 * abs ( x1*y2 + x2*y3 + x3*y1 - x1*y3 - x3*y2 - x2*y1 )

    // ( points[0].x , points[0].y ) ( points[1].x , points[1], y )  ( points[2].x ) ( points[2].y ))
    
    func calculateResult() -> Double{
        let x1 = points[0].x
        let y1 = points[0].y
        let x2 = points[1].x
        let y2 = points[1].y
        let x3 = points[2].x
        let y3 = points[2].y
        return  0.5 * Double(abs( x1*y2 + x2*y3 + x3*y1 - x1*y3 - x3*y2 - x2*y1))
    }
}
