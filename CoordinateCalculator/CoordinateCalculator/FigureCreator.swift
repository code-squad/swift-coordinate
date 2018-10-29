//
//  FigureCreator.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Figure {
    func readPoints() -> [MyPoint]
}

protocol CalculatedFigure : Figure {
    func calculate() -> Double
    func calculateMent() -> String
}

struct FigureCreator {
    static func createFigure(_ input:[MyPoint]) -> Figure {
        switch input.count {
        case 1:
            return createPoint(input)
        case 2:
            return createLine(input)
        case 3:
            return createTriangle(input)
        case 4:
            return createRect(input)
        default:
            return MyPoint.init(x: 0, y: 0)
        }
    }

    static private func createPoint(_ input:[MyPoint]) -> MyPoint {
        return input[0]
    }
    
    static private func createLine(_ input:[MyPoint]) -> MyLine {
        return MyLine.init(input[0], input[1])
    }
    
    static private func createTriangle(_ input:[MyPoint]) -> MyTriangle {
        return MyTriangle.init(input[0], input[1], input[2])
    }
    
    static private func createRect(_ input:[MyPoint]) -> MyRect {
        return MyRect.init(origin: readLeftTopPoint(input), size: <#T##CGSize#>)
    }
    
    static private func readLeftTopPoint(_ input:[MyPoint]) -> MyPoint {
        var x = ANSICode.axis.AxisLimit
        var y = 0
        
        for point in input {
            x = x > point.readX() ? point.readX() : x
            y = y < point.readY() ? point.readY() : y
        }
        
        return MyPoint(x: x, y: y)
    }
    
//    static private func readSize(_ input:[MyPoint]) -> CGSize {
//        
//        
//    }
    
    static func separateHyphen(_ coordinate:String) -> [String] {
        return coordinate.split(separator: "-").map {String($0)}
    }
    
    static func readPoint(_ coordinate:String) -> MyPoint {
        let x = coordinate.split(separator: "(")[0].split(separator: ",")[0]
        let y = coordinate.split(separator: ",")[1].split(separator: ")")[0]
        let xy = MyPoint(x:Int(x) ?? ANSICode.axis.AxisLimit + 1, y:Int(y) ?? ANSICode.axis.AxisLimit + 1)
        return xy
    }
}
