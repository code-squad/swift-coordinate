//
//  CreatePoint.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeCreator{
    
    let pointCount : Int = 1
    let lineCount : Int = 2
    let triangleCount : Int = 3
    let rectCount : Int = 4
    
    // MyPoint, MyLine을 생성할지 결정
    func CreateShape(input: String) -> Shape? {
        let points : [String] = input.split(separator: "-").map(String.init)
        switch points.count {
        case pointCount:
            return createPoint(position: input)
        case lineCount:
            return createLine(line: points)
        case triangleCount:
            return createTriangle(triangle: points)
        case rectCount:
            return nil
        default:
            return nil
        }
    }
    
    // "-"을 기준으로 점이 1개일 경우 Point을 생성
    func createPoint(position: String) -> MyPoint? {
        let xyPosition : [String] = position.extractPosition()
        guard let xPosition = Double(xyPosition[1]) else { return nil }
        guard let yPosition = Double(xyPosition[2]) else { return nil }
        return MyPoint(xPosition, yPosition)
    }
    
    // "-"을 기준으로 점이 2개일 경우 Line을 생성
    private func createLine(line: [String]) -> MyLine? {
        guard let pointA = createPoint(position: line[0]) else { return nil }
        guard let pointB = createPoint(position: line[1]) else { return nil }
        return MyLine(pointA, pointB)
    }
    
    // "-"을 기준으로 점이 3개일 경우 Triangle을 생성
    private func createTriangle(triangle: [String]) -> MyTriagnle? {
        guard let pointA = createPoint(position: triangle[0]) else { return nil }
        guard let pointB = createPoint(position: triangle[1]) else { return nil }
        guard let pointC = createPoint(position: triangle[2]) else { return nil }
        return MyTriagnle(pointA, pointB, pointC)
    }
    
    // "-"을 기준으로 점이 4개일 경우 Rect을 생성
//    private func createRect(rect: [String]) -> MyRect? {
//        var points : [MyPoint] = []
//        for point in rect {
//            guard let tempPoint = createPoint(position: point) else { return nil }
//            points.append(tempPoint)
//        }
//        points = points.sorted(by: { $0.xPosition < $1.xPosition })
//        let cgSize = CGSize(width: points[2].xPosition - points[1].xPosition , height: abs(points[0].yPosition-points[1].yPosition))
//
//        return nil
//    }
}
