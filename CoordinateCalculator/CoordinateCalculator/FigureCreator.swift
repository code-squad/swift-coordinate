//
//  FigureCreator.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureCreator {
    func createFigure(points: Points) -> Figure {
        switch points.count {
        case 2:
            return createLine(points: points)
        case 3:
            return createTriangle(points: points)
        case 4:
            return createRect(points: points)
        default:
            return createPoint(point: (points[0].x, points[0].y))
        }
    }
    
    private func createPoint(point: (x: Int, y: Int)) -> Figure {
        return MyPoint.init(x: point.x, y: point.y)
    }
    
    private func createLine(points: Points) -> Figure {
        let pointA : MyPoint = createPoint(point: points[0]) as! MyPoint
        let pointB : MyPoint = createPoint(point: points[1]) as! MyPoint
        return MyLine.init(pointA: pointA, pointB: pointB)
    }
    
    private func createTriangle(points: Points) -> Figure {
        let pointA : MyPoint = createPoint(point: points[0]) as! MyPoint
        let pointB : MyPoint = createPoint(point: points[1]) as! MyPoint
        let pointC : MyPoint = createPoint(point: points[2]) as! MyPoint
        return MyTriangle.init(pointA: pointA, pointB: pointB, pointC: pointC)
    }
    
    private func createRect(points: Points) -> Figure {
        let origin : MyPoint = createPoint(point: getOriginForRect(points: points)) as! MyPoint
        let size : CGSize = getSizeForRect(points: points)
        return MyRect.init(origin: origin, size: size)
    }
    
    private func getOriginForRect(points: Points) -> (x: Int, y: Int) {
        var origin : (x: Int, y: Int) = (points[0].x, points[0].y)
        for point in points {
            if origin.x >= point.x && origin.y <= point.y {
                origin.x = point.x
                origin.y = point.y
            }
        }
        return origin
    }
    
    private func getSizeForRect(points: Points) -> CGSize {
        var size : CGSize = CGSize.init(width: 0, height: 0)
        let origin : (x: Int, y: Int) = (points[0].x, points[0].y)
        for point in points {
            if origin.x != point.x {
                size.width = CGFloat(abs(point.x - origin.x))
            }
            if origin.y != point.y {
                size.height = CGFloat(abs(point.y - origin.y))
            }
        }
        return size
    }
}
