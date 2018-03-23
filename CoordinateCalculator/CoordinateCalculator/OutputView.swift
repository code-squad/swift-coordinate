//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func clean() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }

    static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }

    static func drawPoints(at shpae:Shape) {
        for point in shpae.points{
            print("\(ANSICode.cursor.move(row:point.yOfCoordinates, col: point.xOfCorrdinates))\(ANSICode.text.redBright)●")
        }
    }
    
    static func result(of myPoints:Shape){
        if myPoints is MyLine {
            let myLine = myPoints as! MyLine
            print("\(myLine.distance())")
        }
    }
}
