//
//  CoordinateTrixCalculater.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 7..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Calculator {
    
    private func countPointsValue(_ coordinateValue: String) -> (pointsKind: PointsInfo, points: [String]) {
        var separatePoints = coordinateValue.components(separatedBy: "-")
        var separatePointInfo: PointsInfo {
            get {
                switch separatePoints.count{
                case 1:
                    return PointsInfo.point
                case 2:
                    return PointsInfo.line
                default:
                    return PointsInfo.point
                }
            }
        }
        return (separatePointInfo, separatePoints)
    }
    
    private func confirm(points: [Int]) -> Bool {
        if points.isEmpty || points.count == 1 {
            print("다시입력해주세요. 괄호안에는 정수가 와야합니다. :)")
            return false
        }
        for index in 0...1 {
            if points[index] < 0 || points[index] > 24 {
                print("x,y 값은 0 <= x,y <= 24 합니다. :) 다시입력해주세요.")
                return false
            }
        }
        return true
    }
    
    func extract(_ pointModel: CoordinateModel) throws {
        let kindOfInputAndPoints = countPointsValue(pointModel.inputCoordinateValue)
        pointModel.pointsKind = kindOfInputAndPoints.pointsKind
        var separatePoints = kindOfInputAndPoints.points
        var dotPoints: [MyPoint] = [MyPoint()]
        dotPoints.remove(at: 0)
        
        for pointsIndex in 0..<separatePoints.count {
            separatePoints[pointsIndex].remove(at: separatePoints[pointsIndex].startIndex)
            separatePoints[pointsIndex].remove(at: separatePoints[pointsIndex].index(before: separatePoints[pointsIndex].endIndex))
            let separateAxisValue = separatePoints[pointsIndex].components(separatedBy: ",").flatMap{ Int($0) }
            if confirm(points: separateAxisValue) {
                var dotPoint = MyPoint()
                dotPoint.x = separateAxisValue[0]
                dotPoint.y = separateAxisValue[1]
                dotPoints.append(dotPoint)
            } else {
                throw InputViewError.invalidPoint
            }
        }
        pointModel.trixInfo.point = dotPoints
    }
    
    func sortAndMakePoints(_ coordinateModel: CoordinateModel) {
        switch coordinateModel.pointsKind{
        case .point:
            coordinateModel.pointsKind = .point
        case .line:
            let line = MyLine(pointA: coordinateModel.trixInfo.point[0], pointB: coordinateModel.trixInfo.point[1])
            let lineDistance = line.calcurateDistanceTwoPoints()
            coordinateModel.trixInfo.value = lineDistance
        }
    }
    
}
