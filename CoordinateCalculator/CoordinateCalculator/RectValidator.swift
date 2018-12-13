//
//  RectValidator.swift
//  CoordinateCalculator
//
//  Created by Elena on 12/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

// 사각형
/*
 // 직사각형 조건.
 // 대각선 2개의 길이가 같고 사각형 4개의 각이 전부 직각(90도)여야 함.
 // 대각선 2개는 길이 구해서 비교하면 됨. 
 // sortedPoints[1]부터 sortedPoints[2]까지의 거리를 비교.
 // 사각형의 4개의 각은 서로 마주보고 있는 부분의 각도가
 // 둘다 직각(90도)이면 사각형안의 모든 각은 전부 직각
 // 각이 직간인지 확인하는 방법은 피타고라스 정리를 이용합니다. 각이 직각이면 A^2 = B^2 + C^2이니까
 // 반대로 말하면 A^2 = B^2 + C^2 식을 만족하면 각이 직각
 // 조건이 참이 아니면 일반적으로 들어오는 사각형 좌표 체크를 위해 다음 블럭 진행.
 // 좌표를 그림으로 그리면.
 // myPoints[1]         myPoints[3]
 //
 // myPoints[0]         myPoints[2]
 */
struct RectValidator {
    private func pointSort(_ points: [MyPoint]) -> [MyPoint] {
        let points = points.sorted(by: {$0.x < $1.x})
        return points
    }
    
    // 비교
    func isRectDiagonal(_ points: [MyPoint]) ->Bool {
        let points = pointSort(points)
        // 대각선
        let diagonalA = MyLine(MyPoint(x: points[0].x, y: points[0].y), MyPoint(x: points[3].x, y: points[3].y)).valueOfPoint
        let diagonalB = MyLine(MyPoint(x: points[1].x, y: points[1].y), MyPoint(x: points[2].x, y: points[2].y)).valueOfPoint
        let doubleDiagonal = powLine(MyLine(MyPoint(x: points[1].x, y: points[1].y), MyPoint(x: points[2].x, y: points[2].y)))
        
        let sumOfLine = rectLine(points)
        
        if diagonalA == diagonalB , sumOfLine[0] == doubleDiagonal , sumOfLine[1] == doubleDiagonal {
            print(MyLine(MyPoint(x: points[0].x, y: points[0].y), MyPoint(x: points[1].x, y: points[1].y)).valueOfPoint * MyLine(MyPoint(x: points[0].x, y: points[0].y), MyPoint(x: points[2].x, y: points[2].y)).valueOfPoint)
            return true
        }
        return false
    }
    
    private func powLine(_ Myline: MyLine) -> Double {
        let lineA = abs(Int32(Myline.pointB.x - Myline.pointA.x))
        let lineB = abs(Int32(Myline.pointB.y - Myline.pointA.y))
        return pow(Double(lineB),2) + pow(Double(lineA), 2)
    }
    //직각인지 판단하기 위해
    private func rectLine(_ points: [MyPoint]) -> [Double] {
        let lineA = powLine(MyLine(MyPoint(x: points[0].x, y: points[0].y),MyPoint(x: points[1].x, y: points[1].y)))
        let lineB = powLine(MyLine(MyPoint(x: points[0].x, y: points[0].y),MyPoint(x: points[2].x, y: points[2].y)))
        let lineC = powLine(MyLine(MyPoint(x: points[3].x, y: points[3].y),MyPoint(x: points[1].x, y: points[1].y)))
        let lineD = powLine(MyLine(MyPoint(x: points[3].x, y: points[3].y),MyPoint(x: points[2].x, y: points[2].y)))
        
        let sumOfLineAB = (lineA + lineB)
        let sumOfLineCD = (lineC + lineD)
        
        return [sumOfLineAB,sumOfLineCD]
    }
}

