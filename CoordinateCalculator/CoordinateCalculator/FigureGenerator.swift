//
//  FigureGenerator.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 27/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureGenerator {
    
    static func generate(from pointTuples: [PointTuple]) -> FigureProtocol? {
        let figure: FigureProtocol?
        switch pointTuples.count {
        case 1:
            figure = MyPoint(x: pointTuples[0].x, y: pointTuples[0].y)
        case 2:
            let points = pointTuples.map {MyPoint(x: $0.x, y: $0.y)}
            figure = MyLine(startPoint: points[0], endPoint: points[1])
        case 3:
            let points = pointTuples.map {MyPoint(x: $0.x, y: $0.y)}
            figure = MyTriangle(pointA: points[0], pointB: points[1], pointC: points[2])
        case 4:
            let points = pointTuples.map {MyPoint(x: $0.x, y: $0.y)}
            figure = generateValidRect(from: points)
        default:
            return nil
        }
        return figure
    }
    
    static func generateValidRect(from points: [MyPoint]) -> MyRect? {
        if !isValidRect(points) {
            print("올바르지 않은 사각형 모양입니다.")
            return nil
        }
        var sortablePoints = points
        sortablePoints.sort(by: {$0.x < $1.x}) // result:(10,10)-LB, (10,18)-LT, (22,10)-RB, (22,18)-RT
        let leftTop = sortablePoints[1]
        let leftBottom = sortablePoints[0]
        let rightTop = sortablePoints[3]
        let lineLeftColumn = MyLine(startPoint: leftBottom, endPoint: leftTop)
        let lineTopRow = MyLine(startPoint: leftTop, endPoint: rightTop)
        let size = CGSize(width: lineTopRow.valueOfFigure, height: lineLeftColumn.valueOfFigure)
        return MyRect(origin: leftTop, size: size)
    }
    
    static func isValidRect(_ points: [MyPoint]) -> Bool {
        let pivot = points[0] // 기준이 되는 점은 아무거나 상관없음.
        /*
         기준점이 어느점이 되었던간에 올바른 사각형 모양이라면 기준점과 x좌표만 같은 점(sameXWithPivot)과 y좌표만 같은 점(sameYWithPivot)이 존재할 것이다. (1,2)
         그리고 그런 두 점과 기준점을 제외한 나머지 점이 기준점과의 대각선으로 대치하고 있는 점이 되는데 (opposite)
         올바른 사각형 모양이라면 이 점(opposite)의 x좌표는 sameYWithPivot의 x 좌표와 같고 y좌표는 sameXWithPivot의 y좌표와 같아야 한다. 
        */
        guard let sameXWithPivot = (points.filter {$0.x == pivot.x && $0.y != pivot.y}).first else { return false } // --- 1
        guard let sameYWithPivot = (points.filter {$0.x != pivot.x && $0.y == pivot.y}).first else { return false } // --- 2
        guard let opposite = (points.filter {$0.x != pivot.x && $0.y != pivot.y}).first else { return false }
        return opposite.x == sameYWithPivot.x && opposite.y == sameXWithPivot.y ? true : false
    }
}

