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
        let stringPoint : [String] = input.split(separator: "-").map(String.init)
        var myPoints : [MyPoint] = []
        for point in stringPoint {
            guard let tempPoint = createPoint(position: point) else { return nil }
            myPoints.append(tempPoint)
        }
        switch stringPoint.count {
        case pointCount:
            return myPoints[0]
        case lineCount:
            return createLine(line: myPoints)
        case triangleCount:
            return createTriangle(triangle: myPoints)
        case rectCount:
            return createRect(rect: myPoints)
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
    private func createLine(line: [MyPoint]) -> MyLine {
        return MyLine(line[0], line[1])
    }
    
    // "-"을 기준으로 점이 3개일 경우 Triangle을 생성
    private func createTriangle(triangle: [MyPoint]) -> MyTriagnle {
        return MyTriagnle(triangle[0], triangle[1], triangle[2])
    }
    
    // "-"을 기준으로 점이 4개일 경우 Rect을 생성
    private func createRect(rect: [MyPoint]) -> MyRect? {
        var rect : [MyPoint] = rect
        rect = rect.sorted(by: { $0.xPosition < $1.xPosition })
        let cgSize = CGSize(width: rect[2].xPosition - rect[1].xPosition , height: abs(rect[0].yPosition-rect[1].yPosition))
        guard rect[0].yPosition > rect[1].yPosition else { return MyRect(origin: rect[1], size: cgSize) }
        return MyRect(origin: rect[0], size: cgSize)
    }
}
