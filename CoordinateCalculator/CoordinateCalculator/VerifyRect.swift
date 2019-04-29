//
//  VerifyRect.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct VerifyRect {
    private func distinctTwoPoints(leftTop: MyPoint, rightBottom: MyPoint) -> (crossPoint: MyCrossPoint, diagonalLength:Double){
        let crossPoint = MyCrossPoint(crossX: Double(leftTop.x) + Double(rightBottom.x-leftTop.x)/2, crossY: Double(leftTop.y) + Double(rightBottom.y-leftTop.y)/2)
        let diagonalLength = MyLine.lengthCalculator(MyLine.init(startPoint: leftTop, endPoint: rightBottom))()
        return (crossPoint,diagonalLength)
    }
    
    func outputTwoDiagonal (points : [MyPoint], lines : [Double]) -> (locations:[MyPoint], rowLine: (crossPoint:MyCrossPoint,diagonalLength:Double), colLine: (crossPoint:MyCrossPoint,diagonalLength:Double)){
        var locations : [MyPoint] = []
        var copyPoints = points
        let rightIndex = lines.index(of: lines.max()!)! // 기본으로 지정한 점과 가장 먼 거리에 있는 점이 있는 좌표의 인덱스
        copyPoints.remove(at: 0)
        copyPoints.remove(at: rightIndex)
        let rowLine = distinctTwoPoints(leftTop: points[0], rightBottom: points[rightIndex+1]) // 기본으로 지정한 점과 가장 멀리있는 점을 잇는 대각선
        let colLine = distinctTwoPoints(leftTop: copyPoints[0], rightBottom: copyPoints[1]) // 나머지 두점을 잇는 대각선
        locations.append(points[0])
        locations.append(points[rightIndex+1])
        locations.append(copyPoints[0])
        locations.append(copyPoints[1])
        return (locations,rowLine,colLine)
    }
}
