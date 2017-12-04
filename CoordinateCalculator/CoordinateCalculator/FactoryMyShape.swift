//
//  FactoryMyShape.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 24..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct FactoryMyShape {

    enum ShapeError: String, Error {
        case wrongLine = "직선을 생성할 수 없는 좌표입니다."
        case wrongTriangle = "삼각형을 생성할 수 없는 좌표입니다."
        case wrongRect = "직사각형을 생성할 수 없는 좌표입니다."
        case unexpected = "Unexpected Error"
    }
    
    // [MyPoint]를 그대로 생성자에 넘기는걸 생각해보기
    func makeShape (_ myPoints: [MyPoint]) throws -> MyShape {
        switch myPoints.count {
        case 1: return MyPoint(x: myPoints[0].x, y: myPoints[0].y)
            
        case 2:
            if !MyLine.isValidShape(myPoints) {
                throw ShapeError.wrongLine
            }
            return MyLine(pointA: myPoints[0], pointB: myPoints[1])
       
        case 3:
            if !MyTriangle.isValidShape(myPoints) {
               throw ShapeError.wrongTriangle
            }
            return MyTriangle(tripointA: myPoints[0], tripointB: myPoints[1], tripointC: myPoints[2])
        
        case 4:
            if !MyRect.isValidShape(myPoints) {
                throw ShapeError.wrongRect
            }
            let rectWidth = abs(myPoints[2].x - myPoints[0].x)
            let rectHeight = abs(myPoints[0].y - myPoints[2].y)
            
            return MyRect(origin: myPoints[0],
                          size: CGSize(width: rectWidth, height: rectHeight))
            
        default:
            return myPoints[0]}
    }
}

protocol MyShape {
    static func isValidShape(_ myPoints:[MyPoint]) -> Bool
    func getMyPoints() -> [(Int,Int)]
}

protocol ResultByShape {
    func messageByShape() -> String
    func calculate() -> Double
}

