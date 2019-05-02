//
//  MyShapeFactory.swift
//  CoordinateCalculator
//
//  Created by hw on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyShapeFactory: ShapeCreatable {
   static func createShape(pointList: [Pair]) throws -> Shapable {
        switch pointList.count {
        case 1:
            let myShape: Shapable = MyPoint.init(pointList: pointList)
            return myShape
        case 2:
            let myShape: Shapable = try createLine(pointList)
            return myShape
        case 3:
            let myShape: Shapable = try createTriangle(pointList)
            return myShape
        default:
            throw ErrorCode.ShapeCreationError
        }
    }
    
    static private func createLine(_ pointList : [Pair]) throws -> Shapable {
        let pointA : Shapable = MyPoint.init(pointList: [pointList[0]])
        let pointB : Shapable = MyPoint.init(pointList: [pointList[1]])
        guard let myPointA = pointA as? MyPoint, let myPointB = pointB as? MyPoint else{
            throw ErrorCode.ShapeCreationError
        }
        let myShape: MyLine = MyLine.init(pointA: myPointA, pointB: myPointB)
        return myShape
    }
    
    static private func createTriangle(_ pointList : [Pair]) throws -> Shapable {
        let pointA : Shapable = MyPoint.init(pointList: [pointList[0]])
        let pointB : Shapable = MyPoint.init(pointList: [pointList[1]])
        let pointC : Shapable = MyPoint.init(pointList: [pointList[2]])
        guard let myPointA = pointA as? MyPoint, let myPointB = pointB as? MyPoint,
            let myPointC = pointC as? MyPoint else{
                throw ErrorCode.ShapeCreationError
        }
        let myShape: MyTriangle = MyTriangle.init(pointA: myPointA, pointB: myPointB, pointC: myPointC)
        return myShape
    }
}
