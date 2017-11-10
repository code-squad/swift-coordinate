//
//  CoordinateTrixCalculater.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 7..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Calculator {
    
    func extract(_ pointModel: CoordinateModel) throws {
        let kindOfInputAndPoints = countPointsValue(pointModel.inputCoordinateValue)
        pointModel.generatrix = kindOfInputAndPoints.generatrix
        var separatePoints = kindOfInputAndPoints.points
        var dotPoints: [MyPoint] = [MyPoint()]
        dotPoints.remove(at: 0)
        
        for pointsIndex in 0..<separatePoints.count {
            separatePoints[pointsIndex].remove(at: separatePoints[pointsIndex].startIndex)
            separatePoints[pointsIndex].remove(at: separatePoints[pointsIndex].index(before: separatePoints[pointsIndex].endIndex))
            let separateAxisValue = separatePoints[pointsIndex].components(separatedBy: ",").flatMap{ Int($0) }
            if confirm(points: separateAxisValue) {
                let dotPoint = MyPoint(x: separateAxisValue[0], y: separateAxisValue[1])
                dotPoints.append(dotPoint)
            } else {
                throw InputViewError.invalidPoint
            }
        }
        
        pointModel.pointsAndResult.point = dotPoints
        
        do {
            try sortAndMakePoints(pointModel)
        } catch InputViewError.invalidRectangle {
            throw InputViewError.invalidRectangle
        }
    }
    
    private func countPointsValue(_ coordinateValue: String) -> (generatrix: Generatrixs, points: [String]) {
        var separatePoints = coordinateValue.components(separatedBy: "-")
        var separatePointInfo: Generatrixs {
            get {
                switch separatePoints.count{
                case 1:
                    return Generatrixs.point
                case 2:
                    return Generatrixs.line
                case 3:
                    return Generatrixs.triangle
                case 4:
                    return Generatrixs.rectangle
                default:
                    return Generatrixs.point
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
    
    private func checkRectPoints(_ coordinateModel: CoordinateModel) -> Bool {
        if coordinateModel[0].x != coordinateModel[3].x ||
            coordinateModel[0].y != coordinateModel[1].y ||
            coordinateModel[1].x != coordinateModel[2].x ||
            coordinateModel[2].y != coordinateModel[3].y {
            print("다시입력해주세요. 마름모는 입력하실 수 없습니다. :)")
            return false
        }
        return true
    }
    
    private func sortAndMakePoints(_ coordinateModel: CoordinateModel) throws {
        switch coordinateModel.generatrix{
        case .point:
            coordinateModel.generatrix = .point
        case .line:
            let line = MyLine(pointA: coordinateModel[0], pointB: coordinateModel[1])
            let lineDistance = line.calcurateDistanceTwoPoints()
            coordinateModel.pointsAndResult.value = lineDistance
        case .triangle:
            let triangle = MyTriangle(pointA: coordinateModel[0], pointB: coordinateModel[1], pointC: coordinateModel[2])
            let triangleArea = triangle.calculateTriangleArea()
            coordinateModel.pointsAndResult.value = triangleArea
        case .rectangle:
            if !checkRectPoints(coordinateModel) {
                throw InputViewError.invalidRectangle
            }
            let rectValue = MyRect.calculateOriginOfRectAndSize(coordinateModel)
            let rect = MyRect(origin: rectValue.points, size: rectValue.size)
            let rectArea = rect.calculateRectArea()
            coordinateModel.pointsAndResult.value = rectArea
        }
    }
}
