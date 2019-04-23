//
//  Triangle.swift
//  CoordinateCalculator
//
//  Created by 김성현 on 23/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Triangle: Drawable {
    
    var isDrawable: Bool {
        if ANSICode.CoordinateGrid.gridRange.contains(lineAB.start.x),
            ANSICode.CoordinateGrid.gridRange.contains(lineAB.start.y),
            ANSICode.CoordinateGrid.gridRange.contains(lineAB.end.x),
            ANSICode.CoordinateGrid.gridRange.contains(lineAB.end.y),
            ANSICode.CoordinateGrid.gridRange.contains(lineAC.end.x),
            ANSICode.CoordinateGrid.gridRange.contains(lineAC.end.x){
            return true
        }
        return false
    }
    
    var points: [Point] {
        return [lineAB.start, lineAB.end, lineAC.end]
    }
    
    var description: String {
        //TODO: 삼각형 설명 입력하기
        return ""
    }
    
    var lineAB: Line
    var lineAC: Line
    var lineBC: Line
    
    
    init(pointA: Point, pointB: Point, pointC: Point) {
        lineAB = Line(start: pointA, end: pointB)
        lineAC = Line(start: pointA, end: pointC)
        lineBC = Line(start: pointB, end: pointC)
    }
    
}
