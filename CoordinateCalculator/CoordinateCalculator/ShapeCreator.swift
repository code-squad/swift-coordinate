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
    
    // MyPoint, MyLine을 생성할지 결정
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
    
    // 좌표를 생성
    private func createPosition(position: String) -> Position? {
        let xyPosition : [String] = position.components(separatedBy: ["(", ")", ","])
        guard let xPosition = Double(xyPosition[1]) else { return nil }
        guard let yPosition = Double(xyPosition[2]) else { return nil }
        return Position(xPosition, yPosition)
    }
    
    // "-"을 기준으로 점이 1개일 경우 Point을 생성
    private func createPoint(point: String) -> MyPoint?{
        guard let pointA = createPosition(position: point) else { return nil }
        return MyPoint(pointA)
    }
    
    // "-"을 기준으로 점이 2개일 경우 Line을 생성
    private func createLine(line: String) -> MyLine?{
        let points : [String] = line.split(separator: "-").map(String.init)
        guard let pointA = createPosition(position: points[0]) else { return nil }
        guard let pointB = createPosition(position: points[1]) else { return nil }
        return MyLine(pointA, pointB)
    }
}
