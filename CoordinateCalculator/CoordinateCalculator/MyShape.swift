//
//  Shape.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/11/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

protocol FigureProtocol {
    var points: [MyPoint] { get }
}
protocol DistanceProtocol: FigureProtocol {
    var descriptionTwoPoint: String { get }
    var valueOfPoint: Double { get }
}

struct MyShape {
    static func makePoint(from coordinate: String) -> MyPoint? {
        // 포인트 하나가 조건이 맞는지 검사
        let validator = TextValidator(text: coordinate)
        guard  validator.isValidPoint() else {
            return nil
        }
        //포인트를 만들기
        let point = StringProcessing.dividePoint(from: coordinate)
        //x,y 가 범위에 있지 않으면 nil
        guard validator.isRangePoint(num: point.x) , validator.isRangePoint(num: point.y) else { return nil }
        return MyPoint(x: point.x, y: point.y)
    }
    //point , myline2가지 형이 있기때문에 프로토콜로 해준다.
    static func generateShape(_ points: [MyPoint]) -> FigureProtocol? {
        switch points.count {
        case 0:
            return nil
        case 1:
            return MyPoint(x: points[0].x, y: points[0].y)
        case 2:
            return MyLine(points[0],points[1])
        case 3:
            return MyTriangle(pointA: points[0], pointB: points[1], pointC: points[2])
        default:
            return nil
        }
    }
}
