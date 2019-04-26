//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by hw on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func drawPoint(_ myPoint: MyPoint){
        print("\(ANSICode.text.whiteBright)\(ANSICode.point.drawPoint(myPoint))")
    }
    
    static func drawLine (_ myLine: MyLine){
        print("\(ANSICode.text.whiteBright)\(ANSICode.point.drawPoint(myLine.pointA))")
        print("\(ANSICode.text.whiteBright)\(ANSICode.point.drawPoint(myLine.pointB))")
        print("\(ANSICode.text.blueBright)\(ANSICode.line.displayDistance(myLine))\(ANSICode.text.whiteBright)")
    }
    
}
