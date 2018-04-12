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
    
    static private func drawPoint(_ mypoint: MyPoint) {
        let zeropointX = 3
        let zeropointY = ANSICode.axis.AxisLimit + 1
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: zeropointY - mypoint.y , col: zeropointX + mypoint.x * 2))\(CODRDINATE_CURSOR)")
    }
    
    static private func drawLine(_ myline: MyLine) {
        for point in myline.getPoints() {
            drawPoint(point)
        }
    }
    
    static private func twoPointDistance(_ myPoints: BaseProtocol) {
        switch myPoints {
            case let myline as MyLine: print(myline.getDistance())
        default: return
        }
    }
    
    // points : MyPoint or MyLine
    static func draw(_ modelType: BaseProtocol) throws {
        
        switch modelType {
            case let mypoint as MyPoint: drawPoint(mypoint)
            case let myline as MyLine: drawLine(myline)
        default: throw CoordinateError.unknownFormatKeyError
        }
        
        drawAxis()
        twoPointDistance(modelType)
    }
    
    static func clean() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }

}
