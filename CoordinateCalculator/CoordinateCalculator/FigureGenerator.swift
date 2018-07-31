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
            figure = MyRect(points: points)
        default:
            return nil
        }
        return figure
    }
}

