//
//  CreatePoint.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeCreator{
    
    var pointCount : Int = 1
    var lineCount : Int = 2
    
    func CreateShape(input: String) -> Shape? {
        switch input.split(separator: "-").count {
        case pointCount:
            return createPoint(point: input)
        case lineCount:
            return createLine(line: input)
        default:
            return nil
        }
    }
    
    // "-"을 기준으로 점이 2개일 경우 Line을 생성
    private func createLine(line: String) -> MyLine?{
        let points : [String] = line.split(separator: "-").map(String.init)
        guard let pointA = createPoint(point: points[0]) else { return nil }
        guard let pointB = createPoint(point: points[1]) else { return nil }
        return MyLine(pointA, pointB)
    }
    
    // "-"을 기준으로 점이 1개일 경우 Point을 생성
    private func createPoint(point: String) -> MyPoint?{
        let xyPosition : [String] = point.components(separatedBy: ["(", ")", ","])
        guard let xPosition = Int(xyPosition[1]) else {return nil}
        guard let yPosition = Int(xyPosition[2]) else {return nil}
        return MyPoint(xPosition, yPosition)
    }
    
    // Point를 생성해서 리턴해줌
//    static func createPoint(xyPosition: String) -> MyPoint?{
//        let xyPosition : [String] = xyPosition.components(separatedBy: ["(", ")", ","])
//        guard let xPosition = Int(xyPosition[1]) else {return nil}
//        guard let yPosition = Int(xyPosition[2]) else {return nil}
//        return MyPoint(xPosition: xPosition, yPosition: yPosition)
//    }
}
