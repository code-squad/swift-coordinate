//
//  MyShapeFactory.swift
//  CoordinateCalculator
//
//  Created by hw on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

private typealias SortedPointSet = (xSet: [Int], ySet: [Int])
struct MyShapeFactory: ShapeCreatable {
   static func createShape(pointList: [Pair]) throws -> Pointable {
        switch pointList.count {
        case 1:
            let myShape: Pointable = MyPoint.init(pointList: pointList)
            return myShape
        case 2:
            let myShape: Pointable = try createLine(pointList)
            return myShape
        case 3:
            let myShape: Pointable = try createTriangle(pointList)
            return myShape
        case 4:
            let myShape: Pointable = try createRectangle(pointList)
            return myShape
        default:
            throw ErrorCode.ShapeCreationError
        }
    }
    
    static private func createLine(_ pointList : [Pair]) throws -> Pointable {
        let pointA : Pointable = MyPoint.init(pointList: [pointList[0]])
        let pointB : Pointable = MyPoint.init(pointList: [pointList[1]])
        guard let myPointA = pointA as? MyPoint, let myPointB = pointB as? MyPoint else{
            throw ErrorCode.ShapeCreationError
        }
        let myShape: MyLine = MyLine.init(pointA: myPointA, pointB: myPointB)
        return myShape
    }
    
    static private func createTriangle(_ pointList : [Pair]) throws -> Pointable {
        let pointA : Pointable = MyPoint.init(pointList: [pointList[0]])
        let pointB : Pointable = MyPoint.init(pointList: [pointList[1]])
        let pointC : Pointable = MyPoint.init(pointList: [pointList[2]])
        guard let myPointA = pointA as? MyPoint, let myPointB = pointB as? MyPoint,
            let myPointC = pointC as? MyPoint else{
                throw ErrorCode.ShapeCreationError
        }
        let myShape: MyTriangle = MyTriangle.init(pointA: myPointA, pointB: myPointB, pointC: myPointC)
        return myShape
    }
    
    static private func createRectangle(_ pointList: [Pair]) throws -> Pointable {
        let distinctRectanglePointSet = try getDistinctRectanglePoints(pointList)
        if checkRectangle(distinctRectanglePointSet) {
            let pairOfleftTopAndRightBottom = decideLeftTopAndRightBottom(sortedX: distinctRectanglePointSet.xSet, sortedY: distinctRectanglePointSet.ySet)
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
    
    static private func checkRectangle(_ sortedPointSet: SortedPointSet ) -> Bool {
        return sortedPointSet.xSet.count == 2 && sortedPointSet.ySet.count == 2 ? true: false
    }
    static private func getDistinctRectanglePoints(_ pointList: [Pair]) throws -> SortedPointSet {
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
        return SortedPointSet(xSet: sortedX, ySet: sortedY)
    }
}
