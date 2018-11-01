//
//  File.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct PrintView {
    //row = y, col = x
    //변환에 쓰일 상수
    private static let rowConstant = 25
    private static let colConstant = 3
    
    // 출력을 위한 값으로 바꾸기
    private static func modifyPrintable(originalPoint: MyPoint) -> MyPoint {
        let modifiedPoint = MyPoint(x: colConstant + originalPoint.x * 2, y: rowConstant - originalPoint.y)
        return modifiedPoint
    }
    
    // figure 종류를 확인하고 그리기
    static func printOnCoordSystem(_ myFigure: MyFigure) {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        if myFigure is MyLine {
            printLine(myFigure as! MyLine)
        }
        if myFigure is MyPoint {
            printPoint(myFigure as! MyPoint)
        }
        print("\(ANSICode.cursor.move(row:28, col: 51))")
    }
    
    //point 하나를 출력하는 함수
    private static func printPoint(_ myPoint: MyPoint) {
        let printablePoint = modifyPrintable(originalPoint: myPoint)
        print("\(ANSICode.text.yellowBright)\(ANSICode.cursor.move(row: printablePoint.y, col: printablePoint.x))•")
    }
    
    // Line의 두 point와 거리를 출력하는 함수
    private static func printLine(_ myLine: MyLine) {
        let lineComponents = [myLine.pointA, myLine.pointB]
        for lineComponent in lineComponents {
            printPoint(lineComponent)
        }
        print("\(ANSICode.cursor.move(row:27, col: 1)) 두 점 사이 거리는 \(myLine.computeDistance(of: myLine.pointA, to: myLine.pointB))")
    }
    
    // 화면 지우기
    static func eraseDisplay() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    
}
