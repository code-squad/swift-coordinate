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
    
    //code
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
    
    func pointResult(_ point: MyPoint,_ number: Int)->Bool{
        OutputView().resultPoint(inputPoints: point)
        // line에서 point 점찍는걸 재사용하고 싶은데, 값을 두지 않으면 점을 찍고 false를 반환해서
        if number == 0 {
            OutputView().drawEnd()
            return false
        }
        return true
    }
    
    

}
