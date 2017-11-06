//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 25..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static let startOfAxisX = 3         // X축 시작지점
    static let startOfAxisY = 1         // Y축 시작지점
    static let ratioOfAxisX = 2         // X축 화면비율
    static let endYOfPage = ANSICode.axis.AxisLimit+3   // 화면에 보이는 페이지의 가장 마지막 줄 위치(y)
    static let startXOfCommands = 2     // 기타 명령어들이 출력되는 시작지점(x)
    static let posYOfErrorMsg = startOfAxisY + ANSICode.axis.AxisLimit/2
    
    init?(_ userFigure: FigureCalculatable?) {
        guard let userFigure = userFigure else { return nil }
        // 좌표계 중앙에 출력된 에러메시지 지움.
        OutputView.eraseErrorMessage()
        // 정상적인 좌표값인 경우, 해당 좌표에 특수문자 표시.
        OutputView.printNumerousHearts(inShape: userFigure)
    }
    
    // 좌표축 출력.
    static func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.axis.draw())")
    }
    
    // 에러 메시지 출력.
    static func printErrorMessage(of type: FigureFactory.CoordsError) {
        let errorMessage = type.rawValue
        // 에러 메시지를 좌표평면 중간에 출력하기 위한 위치 계산. - 메시지에 숫자나 특수문자가 들어가면 오차 생길 수 있음.
        let posYOfErrorMsg = startOfAxisY + ANSICode.axis.AxisLimit/2
        let posXOfErrorMsg = ( startOfAxisX + (ANSICode.axis.AxisLimit-errorMessage.count)/2 ) * ratioOfAxisX
        // 에러 메시지를 빨간 색상으로 출력.
        print("\(ANSICode.cursor.move(row: posYOfErrorMsg, col: posXOfErrorMsg))\(ANSICode.text.redBright)\(errorMessage)")
    }
    
    // 도형에 따라 출력.
    static func printNumerousHearts(inShape userFigure: FigureCalculatable?) {
        guard let userFigure = userFigure else { return }
        // userFigure의 타입에 따라 하트 출력.
        printHeart(from: userFigure)
        reset()
        printDescription(of: userFigure)
    }
    
    // 좌표계에 특수문자 출력.
    private static func printHeart(from userInput: FigureCalculatable) {
        let userPoints = userInput.getPoints()
        for userPoint in userPoints{
            // 사용자 입력 좌표의 출력 위치 계산.
            let coordX = startOfAxisX + userPoint.x * ratioOfAxisX
            let coordY = startOfAxisY + ANSICode.axis.AxisLimit - userPoint.y
            // 빨간색 하트 출력.
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: coordY, col: coordX))♥︎")
            // 보조선 출력.
            printAssistLine(toX: coordX, andY: coordY)
        }
    }
    
    // 보조선 출력.
    private static func printAssistLine(toX pointX: Int, andY pointY: Int) {
        // x 또는 y 좌표가 0이면 보조선 그리지 않고 탈출. (0,0) = (3,25)
        guard pointX > startOfAxisX && pointY < 25 else { return }
        // 하트까지 x축에 평행하는 점선 출력.
        for x in startOfAxisX+1..<pointX {
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: pointY, col: x))-")
        }
        // 하트까지 y축에 평행하는 점선 출력.
        for y in pointY+1..<ANSICode.axis.AxisLimit+1 {
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: y, col: pointX))|")
        }
    }
    
    // 좌표축 아래에 거리, 넓이 등 기타 정보 출력.
    static func printDescription(of userInput: FigureCalculatable) {
        var description: String = ""
        switch userInput {
        case let userLine as MyLine:
            description = "두 점 사이 거리는 " + String(format: "%.6f", userLine.calculate())
        case let userTriangle as MyTriangle:
            description = "삼각형 넓이는 " + String(format: "%.6f", userTriangle.calculate())
        case let userRect as MyRect:
            description = "사각형 넓이는 " + String(Int(userRect.calculate()))
        default: break
        }
        print("\(ANSICode.text.green)\(ANSICode.cursor.move(row: endYOfPage, col: startXOfCommands))\(description)\(ANSICode.none)")
    }
    
    // 특정 위치부터 가로 끝까지 지움. (에러 메시지 출력 위함.)
    static func eraseErrorMessage() {
        print("\(ANSICode.cursor.move(row: posYOfErrorMsg, col: startOfAxisX+1))\(ANSICode.eraseEndLine)")
    }
    
    private static func reset() {
        // 프로그램 종료 후 커서를 맨 아래에 위치. 색상 등 설정 초기화. (프로그램 종료 후 명령문 위치 지정 위함.)
        print("\(ANSICode.cursor.move(row: endYOfPage, col: startXOfCommands))\(ANSICode.eraseEndLine)\(ANSICode.none)")
    }
    
}

