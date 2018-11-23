//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by Elena on 17/11/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

protocol twoPointProtocol {
    var resultDescription: String { get }
}

struct MyShape {

    func selectPosition(_ count: Int,_ inputPoint: String) -> Bool {
        var point = MyPoint(x: 0, y: 0)
        var line = MyLine.init(point, point)
        
        if count == 2 {
            line = InputView.getLineCoordinate(inputPoint, count)
            guard comparePoint(line.pointA) || comparePoint(line.pointB) else {
                return true
            }
            OutputView().drawPoint()
            return lineResult(line)
        } else {
            point = InputView.getPointCoordinate(inputPoint)
            guard comparePoint(point) else {
                return true
            }
            OutputView().drawPoint()
            return pointResult(point,0)
        }
    }
    
    func comparePoint(_ point: MyPoint) -> Bool {
        switch (point.x, point.y) {
        case (0,0): return false
        case (0,_): return false
        case (_,0): return false
        default: return true
        }
    }
    
    func lineResult(_ line: MyLine) -> Bool{
        guard pointResult(line.pointA,1) else {
            return true
        }
        guard pointResult(line.pointB,1) else {
            return true
        }
        OutputView().displayLine(line)
        OutputView().drawEnd()
        return false
    }
    // number : point일때 출력을 위해 flag
    func pointResult(_ point: MyPoint,_ number: Int)->Bool{
        OutputView().resultPoint(inputPoints: point)
        if number == 0 {
            OutputView().drawEnd()
            return false
        }
        return true
    }
    
    

}
