//
//  MakePoint.swift
//  CoordinateCalculator
//
//  Created by JH on 24/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeMaker {

    static func makeShape(from coordinates: [(x: Int, y: Int)])throws -> DrawableShape? {
        switch coordinates.count {
        case 1:
            return MyPoint(x: coordinates[0].x, y: coordinates[0].y)
        case 2:
            return MyLine(startPoint: MyPoint(x: coordinates[0].x, y: coordinates[0].y), endPoint: MyPoint(x: coordinates[1].x, y: coordinates[1].y))
        case 3:
            return MyTriangle(pointA: MyPoint(x: coordinates[0].x, y: coordinates[0].y), pointB: MyPoint(x: coordinates[1].x, y: coordinates[1].y), pointC: MyPoint(x: coordinates[2].x, y: coordinates[2].y))
        case 4:
            return try makeRect(from: coordinates)
        default:
            return nil
        }
    }
    
    /// 아래 두개의 메소드를 호출해서 사각형만드는 메소드
    private static func makeRect(from coordinates: [(x: Int, y: Int)]) throws -> MyRect {
        let coordinateSet = makeCoordinateSet(from: coordinates)
        guard coordinateSet.xValues.count == 2 && coordinateSet.yValues.count == 2 else {
            throw CoordinateCalculatorError.invalidRectValues
        }
        let xStat = calculateStatistics(numbers: coordinateSet.xValues)
        let yStat = calculateStatistics(numbers: coordinateSet.yValues)
        return MyRect(origin: MyPoint(x: xStat.min, y: yStat.max), size: CGSize(width: xStat.max - xStat.min, height: yStat.max - yStat.min))
    }
    
    /// 최대 최소값 구하는 메소드
    private static func calculateStatistics(numbers: Set<Int>) -> (min: Int, max: Int) {
        var maxNum = Int.min
        var minNum = Int.max
        
        for num in numbers {
            if maxNum < num {
                maxNum = num
            }
            if minNum > num {
                minNum = num
            }
        }
        return (min: minNum, max: maxNum)
    }
    
    /// 입력받은 튜플값을 셋으로 만들어주는 메소드
    private static func makeCoordinateSet(from coordinates: [(x: Int, y: Int)]) -> (xValues: Set<Int>, yValues: Set<Int>) {
       
        var xValues = Set<Int>()
        var yValues = Set<Int>()
        
        //좌표값배열요소 하나씩 접근해서 set타입의 변수에 넣어준다.
        for coordinate in coordinates {
            xValues.insert(coordinate.x)
            yValues.insert(coordinate.y)
        }
        return (xValues, yValues)
    }

    
}
