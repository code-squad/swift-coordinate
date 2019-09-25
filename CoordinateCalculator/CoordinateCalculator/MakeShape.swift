//
//  MakeShape.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MakeShape {
    static func makeShapeByPoints(points: Array<Point>) throws -> Shapable {
        for point in points {
            guard  MyPoint.isValidInRange(point: point) else {
                throw PointValueError.invalidRange(point: point)
            }
        }
        
        var shapeByPoints : Shapable!
        
        switch(points.count) {
        case 1 :
            shapeByPoints = getMyPoint(points: points) as Shapable
        
        case 2 :
            shapeByPoints = try getMyLine(points: points) as Shapable
        
        case 3 :
            shapeByPoints = try getMyTriangle(points: points) as Shapable
        
        case 4 :
            shapeByPoints = try getMyRect(points: points) as Shapable
        
        case 5...Int.max :
            shapeByPoints = try getMyPoly(points: points) as Shapable
            
        default :
            throw PointValueError.invalidFormat
        }
        
        return shapeByPoints
    }
    
    private static func getMyPoint(points: Array<Point>) -> MyPoint {
        return MyPoint(x: points[0].xPos, y: points[0].yPos)
    }
    
    private static func getMyLine(points: Array<Point>) throws -> MyLine {
        guard let line = MyLine(
            pointA: MyPoint(point: points[0]),
            pointB: MyPoint(point: points[1])) else {
                
                throw PointValueError.samePointsExist
        }
        
        return line
    }
    
    private static func getMyTriangle(points: Array<Point>) throws -> MyTriangle {
        guard let triangle = MyTriangle(
            pointA: MyPoint(point: points[0]),
            pointB: MyPoint(point: points[1]),
            pointC: MyPoint(point: points[2])) else {
                
                throw PointValueError.samePointsExist
        }
        
        return triangle
    }
    
    private static func getMyRect(points: Array<Point>) throws -> MyRect {
        let minXpos = points.map {$0.xPos}.min()
        let pointsHasMinXpos = points.filter {$0.xPos == minXpos}
        
        let maxYpos = points.map {$0.yPos}.max()
        let pointsHasMaxYpos = points.filter {$0.yPos == maxYpos}
        
        guard pointsHasMinXpos.count == 2 && pointsHasMaxYpos.count == 2 else {
            throw PointValueError.cantBeRectangle
        }
        
        let leftTop = points.filter {$0.xPos == minXpos && $0.yPos == maxYpos}
        let rightBottom = points.filter {$0.xPos != minXpos && $0.yPos != maxYpos}
        
        guard leftTop.count == 1 && rightBottom.count == 1 else {
            throw PointValueError.samePointsExist
        }
        
        let rect = MyRect(leftTop: MyPoint(point: leftTop[0]), rightBottom: MyPoint(point: rightBottom[0]))
        //let rect = MyRect(origin: MyPoint(point: points[0]), size: CGSize(width: 5, height: 5))
        
        return rect
    }
    
    private static func getMyPoly(points: Array<Point>) throws -> MyPoly {
        let sortedPoints = Utility.getClockWisePolygonPoints(orgPoints: points)
        
        try Utility.checkConvex(sortedPoints: sortedPoints)
        
        var myPoints : [MyPoint] = []
        
        for point in sortedPoints {
            myPoints.append(MyPoint(point: point))
        }
        
        let myPoly = MyPoly(myPoints: myPoints)
        
        return myPoly
    }
    
    
}
