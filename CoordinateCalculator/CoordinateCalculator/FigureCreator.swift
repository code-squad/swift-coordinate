//
//  FigureCreator.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureCreator {
    static func createFigure(_ coordinate:String) -> Figure {
        switch ValidCheck.numberOfHyphenCheck(coordinate) {
        case 0:
            return readPoint(coordinate)
        default:
            return MyPoint(x:1,y:2)
        }
    }
    
    static private func readPoint(_ coordinate:String) -> MyPoint {
        let x = coordinate.split(separator: "(")[0].split(separator: ",")[0]
        let y = coordinate.split(separator: ",")[1].split(separator: ")")[0]
        let xy = MyPoint(x:Int(x) ?? ANSICode.axis.AxisLimit + 1, y:Int(y) ?? ANSICode.axis.AxisLimit + 1)
        return xy
    }
}
