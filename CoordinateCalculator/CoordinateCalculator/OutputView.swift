//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 8. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func deleteAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }

    static func drawPoint(_ points: MyPointConvertible ) {
        let coordinates = points.createCoordinate()
        drawAxis()
        for coordinate in coordinates {
            print("\(ANSICode.cursor.move(row:abs(coordinate.y - 24) , col: coordinate.x * 2 + 4 ))\(ANSICode.text.redBright).")
        }
        print("\(ANSICode.cursor.move(row: 27, col: 0))")
        deleteAxis()
        printAxisExplanation(points)
    }
    
    private static func printAxisExplanation(_ points: MyPointConvertible) {
        print("\(ANSICode.clear)")
        let axisExplanation = points.createCoordinate().count
        switch axisExplanation {
        case 2:
            let line = points as? MyLine
            print("\(ANSICode.cursor.move(row: 1, col: 1))\(ANSICode.text.whiteBright) 두 점 사이 거리는 \(line?.distanceCalc() ?? 0)")
        default:
            break
        }
    }
}
