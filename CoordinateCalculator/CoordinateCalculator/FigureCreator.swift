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

struct FigureCreator {
    static func createFigure(_ input:[MyPoint]) -> Figure {
        switch input.count {
        case 1:
            return createPoint(input)
        case 2:
            return createLine(input)
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
