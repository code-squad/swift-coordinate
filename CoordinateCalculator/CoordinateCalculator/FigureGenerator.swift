//
//  FigureGenerator.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 27/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureGenerator {
    private var pointTuples: [PointTuple]
    
    init(points: [PointTuple]) {
        self.pointTuples = points
    }
    
    func display(){
        switch pointTuples.count {
        case 1:
            OutputView.drawAxis(with: pointTuples.map {MyPoint(x: $0.x, y: $0.y)})
        case 2:
            let points = pointTuples.map {MyPoint(x: $0.x, y: $0.y)}
            OutputView.drawAxis(with: MyLine(startPoint: points[0], endPoint: points[1]))
        case 3:
            let points = pointTuples.map {MyPoint(x: $0.x, y: $0.y)}
            let myTriangle = MyTriangle(pointA: points[0], pointB: points[1], pointC: points[2])
        default:
            print("지원하지 않는 도형입니다.")
        }
    }
}

