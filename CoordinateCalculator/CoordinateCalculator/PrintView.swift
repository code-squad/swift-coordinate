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
    private static func modifyPointsPrintable(originalFigure: MyFigure) -> [MyPoint] {
        let modifiedPoints = originalFigure.points.map { MyPoint(x: colConstant + $0.x * 2, y: rowConstant - $0.y) }
        return modifiedPoints
    }
    
    // figure 종류를 확인하고 그리기
    static func printOnCoordSystem(_ myFigure: MyFigure) {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        printPoint(myFigure)
        printCalculatedResult(myFigure)
        print("\(ANSICode.cursor.move(row:28, col: 51))")
    }
    
    //point 하나를 출력하는 함수
    private static func printPoint(_ myFigure: MyFigure) {
        let figurePoints = modifyPointsPrintable(originalFigure: myFigure)
            for figurePoint in figurePoints {
            print("\(ANSICode.text.yellowBright)\(ANSICode.cursor.move(row: figurePoint.y, col: figurePoint.x))•")
        }
    }
    
    // Line의 두 point와 거리를 출력하는 함수
    private static func printCalculatedResult(_ myFigure: MyFigure) {
        guard let calculatedResult = myFigure.calculatedResult else {return}
        print("\(ANSICode.cursor.move(row:27, col: 1)) \(switchMentBy(figure: myFigure)) \(calculatedResult)")
    }
    
    private static func switchMentBy(figure: MyFigure) -> String {
        switch figure {
        case is MyLine: return "두 점 사이 거리는 "
        default: return "연산이 없습니다"
        }
    }
    
    // 화면 지우기
    static func eraseDisplay() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    
}
