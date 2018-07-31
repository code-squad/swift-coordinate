//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 31/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: Over1DFigureProtocol {
    private var leftTop: MyPoint
    private var rightBottom: MyPoint
    
    var descriptionPrefix: String {
        return "사각형의 넓이는"
    }
    
    var valueOfFigure: Double
    
    var points: [MyPoint] {
        let rightTop = MyPoint(x: rightBottom.x, y: leftTop.y)
        let leftBottom = MyPoint(x: leftTop.x, y: rightBottom.y)
        return [leftTop, rightTop, leftBottom, rightBottom]
    }
    
    private init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: leftTop.x + Int(size.width), y: leftTop.y - Int(size.height))
        self.valueOfFigure = Double(size.width * size.height)
    }
    
    init?(points: [MyPoint]) {
        if !MyRect.isValidRect(points) {
            print("올바르지 않은 사각형 모양입니다.")
            return nil
        }
        let elements = MyRect.generateRectElemets(from: points)
        self.init(origin: elements.origin, size: elements.size)
    }
    
    private static func generateRectElemets(from points: [MyPoint]) -> (origin: MyPoint, size: CGSize) {
        var sortablePoints = points
        sortablePoints.sort(by: {$0.x < $1.x}) // result:(10,10)-LB, (10,18)-LT, (22,10)-RB, (22,18)-RT
        let leftTop = sortablePoints[1]
        let leftBottom = sortablePoints[0]
        let rightTop = sortablePoints[3]
        let lineLeftColumn = MyLine(startPoint: leftBottom, endPoint: leftTop)
        let lineTopRow = MyLine(startPoint: leftTop, endPoint: rightTop)
        let size = CGSize(width: lineTopRow.valueOfFigure, height: lineLeftColumn.valueOfFigure)
        
        return (leftTop, size)
    }
    
    private static func isValidRect(_ points: [MyPoint]) -> Bool {
        let pivot = points[0] // 기준이 되는 점은 아무거나 상관없음.
        /*
         기준점이 어느점이 되었던간에 올바른 사각형 모양이라면 기준점과 x좌표만 같은 점(sameXWithPivot)과 y좌표만 같은 점(sameYWithPivot)이 존재할 것이다.
         그리고 그런 두 점과 기준점을 제외한 나머지 점이 기준점과의 대각선으로 대치하고 있는 점이 되는데 (opposite)
         올바른 사각형 모양이라면 이 점(opposite)의 x좌표는 sameYWithPivot의 x 좌표와 같고 y좌표는 sameXWithPivot의 y좌표와 같아야 한다.
         */
        guard let sameXWithPivot = (points.filter {$0.x == pivot.x && $0.y != pivot.y}).first else { return false } // --- 1
        guard let sameYWithPivot = (points.filter {$0.x != pivot.x && $0.y == pivot.y}).first else { return false } // --- 2
        guard let opposite = (points.filter {$0.x != pivot.x && $0.y != pivot.y}).first else { return false }
        return opposite.x == sameYWithPivot.x && opposite.y == sameXWithPivot.y
    }
}
