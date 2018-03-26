//
//  PointCreator.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum ShapeCreatorError:Error{
    case notSupport
    case isNotRectangle
}

extension ShapeCreatorError:LocalizedError{
    public var errorDescription:String? {
        switch self {
        case .notSupport:
            return "지원하지 않습니다."
        case .isNotRectangle:
            return "직사각형이 아닙니다."
        }
    }
}

struct ShapeCreator {
    func creatPoint(_ points:Points) throws -> Shape {

        switch points.count {
        case 1:
            return createMyPoint(points[0].x, points[0].y)
        case 2:
            return createMyLine(points)
        case 3:
            return createMyTriangle(points)
        case 4:
            return try createMyRectangle(points)
        default:
            throw ShapeCreatorError.notSupport
        }
    }
    
    private func createMyPoint(_ x:Int, _ y:Int) -> MyPoint{
        return MyPoint(x,y)
    }
    
    private func createMyLine(_ points:Points) -> MyLine{
        let pointFirst = createMyPoint(points[0].x, points[0].y)
        let pointSecond = createMyPoint(points[1].x, points[1].y)
        return MyLine(pointFirst, pointSecond)
    }
    
    private func createMyTriangle(_ points:Points) -> MyTriangle {
        let pointFirst = createMyPoint(points[0].x, points[0].y)
        let pointSecond = createMyPoint(points[1].x, points[1].y)
        let pointThird = createMyPoint(points[2].x, points[2].y)
        return MyTriangle(pointFirst, pointSecond, pointThird)
    }
    
    private func createMyRectangle(_ points:Points) throws -> MyRect{
        let sortedPoints = points.sorted{ $0.x < $1.x }
        let leftTop = sortedPoints[0]
        let leftBottom = sortedPoints[1]
        let rightTop = sortedPoints[2]
        
        if isRectangle(sortedPoints){
            let origin = MyPoint(leftTop.x, leftTop.y)
            let width = rightTop.x - leftTop.x
            let height = leftBottom.y - leftTop.y
            return MyRect(origin: origin, size: CGSize(width: width, height: height))
        } else {
            throw ShapeCreatorError.isNotRectangle
        }
    }
    
    private func isRectangle(_ sortedPoints:Points) -> Bool {
        //  leftTop    (x1,y1)  (x3,y3) rightTop
        //  leftBottom (x2,y2)  (x4,y4) rightBottom
        // x1 == x2 && x3 == x4 && y1 == y3 && y2 == y4
        let (x1,y1) = sortedPoints[0]
        let (x2,y2) = sortedPoints[1]
        let (x3,y3) = sortedPoints[2]
        let (x4,y4) = sortedPoints[3]
        let isSameRow = x1 == x2 && x3 == x4
        let isSameCol = y1 == y3 && y2 == y4
        return isSameRow && isSameCol
    }
}
