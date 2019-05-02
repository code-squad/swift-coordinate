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
        case 4:
            let myShape: Shapable = try createRectangle(pointList)
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
    
    static private func createRectangle(_ pointList: [Pair]) throws -> Shapable {
        let checkRectangleResult = try checkRectangle(pointList)
        if checkRectangleResult.isValid {
            let pairOfleftTopAndRightBottom = decideLeftTopAndRightBottom(sortedX: checkRectangleResult.sortedX, sortedY: checkRectangleResult.sortedY)
            let myShape: MyRect = MyRect.init(leftTop: pairOfleftTopAndRightBottom.leftTop, rightBottom: pairOfleftTopAndRightBottom.rightBottom)
            return myShape
        }
        throw ErrorCode.ShapeCreationError
    }
    
    static private func decideLeftTopAndRightBottom(sortedX: [Int], sortedY: [Int]) -> (leftTop: MyPoint, rightBottom: MyPoint){
        let leftTopX: Int = sortedX[0]
        let leftTopY: Int = sortedY[0]
        let rightBottomX: Int = sortedX[1]
        let rightBottomY: Int = sortedY[1]
        let leftTop = MyPoint.init(x: leftTopX, y: leftTopY)
        let rightBottom = MyPoint.init(x: rightBottomX, y: rightBottomY)
        return (leftTop, rightBottom)
    }
    
    static private func checkRectangle(_ pointList: [Pair]) throws -> (isValid: Bool, sortedX: [Int], sortedY: [Int]) {
        guard pointList.count == 4 else{
            throw ErrorCode.ShapeCreationError
        }
        var xPointSet: Set<Int> = Set<Int>()
        var yPointSet: Set<Int> = Set<Int>()
        for point in pointList {
            xPointSet.insert(point.x)
            yPointSet.insert(point.y)
        }
        let sortedX = xPointSet.sorted(by: >)   // descending order
        let sortedY = yPointSet.sorted()        // ascending order
        return (xPointSet.count == 2 && yPointSet.count == 2 ) ? (true, sortedX, sortedY) : (false, sortedX, sortedY)
    }
}
