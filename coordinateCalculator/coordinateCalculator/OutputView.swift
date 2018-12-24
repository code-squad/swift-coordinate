//
//  OutputView.swift
//  coordinateCalculator
//
//  Created by JINA on 29/11/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

struct outputView {
    //MyPoint 출력
    static func drawFigure(_ myPoint: Figure) {
        clear()
        printAxis()
        for points in myPoint.point {
            drawPoint(points)
        }
        moveCursor()
        
        //calculation을 채택하고 있는지 확인하고 출력
        guard let calculate: calculation = myPoint as? calculation else { return }
        printCalculation(calculate)
    }
    
    //커서 옮기기
    static func moveCursor() {
        print("\(ANSICode.cursor.move(row: 27, col: 1))\(ANSICode.text.whiteBright)")
    }

    //calculation을 좌표 하단에 출력
    private static func printCalculation(_ figure: calculation) {
       print("\(ANSICode.cursor.move(row: 27, col: 1))\(ANSICode.text.whiteBright)\(figure.calculateMent())\(figure.calculate())")
    }
    
    //화면에 입력받은 좌표 출력
    private static func drawPoint(_ myPoint: MyPoint) {
        print("\(ANSICode.cursor.move(row: 25 - myPoint.y, col: myPoint.x * 2 + 3))\(ANSICode.text.redBright)●")
    }
    
    //화면을 지우고 좌표축을 그려줌
    private static func printAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    private static func clear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    //오류 메시지
    enum ErrorMessage: String {
        case reEntered = "입력 형식을 확인 후 다시 입력해주세요"
        case denyNum = "직사각형 혹은 정사각형이 아닙니다. 다시입력해주세요"
        case outOfRange = "입력 가능한 숫자 범위는 0~24 입니다."
    }
    
    public static func printErrorMessage(errorMessage:ErrorMessage) {
        print(errorMessage.rawValue)
    }
}
