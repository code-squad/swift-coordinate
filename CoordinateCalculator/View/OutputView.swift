//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
import Foundation
struct OutputView {
    
    static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func errorMessage(of type: CoordinateError) {
        print("Coordinate Error : \(type.rawValue)")
    }
    
    static func questionMessge(msg question: String) {
        print(question)
    }
    
    static func drawPoint(_ mypoint: MyPoint) {
        let zeropointX = 3
        let zeropointY = ANSICode.axis.AxisLimit + 1
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: zeropointY - mypoint.y , col: zeropointX + mypoint.x * 2))\(CODRDINATE_CURSOR)")
    }
    
    static func drawLine(_ myline: MyLine) {
        for point in myline.getPoints() {
            drawPoint(point)
        }
        drawAxis()
        twoPointDistance(myline)
    }
    
    static private func twoPointDistance(_ myline: MyLine) {
        print("두 점 사이 거리는 : \(myline.getDistance())")
    }
    
    static func clean() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }

}
