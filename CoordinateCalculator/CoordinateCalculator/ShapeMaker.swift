//
//  MakePoint.swift
//  CoordinateCalculator
//
//  Created by JH on 24/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeMaker {

    static func makeShape(from coordinates: [(x: Int, y: Int)]) -> DrawableShape? {
        switch coordinates.count {
        case 1:
            return MyPoint(x: coordinates[0].x, y: coordinates[0].y)
        case 2:
            return MyLine(startPoint: MyPoint(x: coordinates[0].x, y: coordinates[0].y), endPoint: MyPoint(x: coordinates[1].x, y: coordinates[1].y))
        case 3:
            return MyTriangle(pointA: MyPoint(x: coordinates[0].x, y: coordinates[0].y), pointB: MyPoint(x: coordinates[1].x, y: coordinates[1].y), pointC: MyPoint(x: coordinates[2].x, y: coordinates[2].y))
        case 4:
            return MyRect(origin: <#T##MyPoint#>, size: <#T##CGSize#>)
        default:
            return nil
        }
    }
    
    
    private static func makeOrigin(coordinates: [(x: Int, y: Int)]) -> (x: Int, y: Int) {
        // 받을값중에 임의로 최소최대값의 초기값을 설정해줌
        var minX = coordinates[0].x
        var maxY = coordinates[0].y
        
        // 받은 좌표값의 원소 하나씩 돌면서 최대 최소값을 찾아서 리턴한다.
        for coordinate in coordinates {
            if minX > coordinate.x {
                minX = coordinate.x
            }
            if maxY < coordinate.y {
                maxY = coordinate.y
            }
        return (x: minX, y: maxY)
        }
    }
    
    
}
