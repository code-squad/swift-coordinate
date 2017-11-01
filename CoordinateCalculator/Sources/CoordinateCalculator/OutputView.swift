//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 25..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{
    static let startOfAxisX = 3         // X축 시작지점
    static let startOfAxisY = 1         // Y축 시작지점
    static let ratioOfAxisX = 2         // X축 화면비율
    static let endYOfPage = ANSICode.axis.AxisLimit+3   // 화면에 보이는 페이지의 가장 마지막 줄 위치(y)
    static let startXOfCommands = 2     // 기타 명령어들이 출력되는 시작지점(x)
    
    
    // MyPoint 구조체 관련 에러 및 에러메시지 종류.
    enum CoordsError: String, Error{
        case isNil = "입력값이 없습니다."                              // nil 에러.
        case outOfBounds = "좌표가 24를 넘지 않도록 입력해주세요."         // 좌표계 최대범위 초과 에러.
        case invalidInputPattern = "형식을 맞춰주세요. 예: (숫자,숫자)-"  // 입력 패턴 에러.
        case invalidRectPoints = "직사각형 좌표를 입력해주세요."     // 직사각형 외 에러.
    }
    
    // 좌표축 출력.
    static func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.axis.draw())")
    }
    
    // 사용자 입력 메뉴 출력 함수. 사용자 입력 문자열 반환.
    static func askFor(message: String) throws -> String?{
        // 요구 메시지 출력.
        print("\(ANSICode.cursor.move(row: endYOfPage, col: startXOfCommands))\(ANSICode.eraseEndLine)\(ANSICode.none)\(message)", terminator: " ")
        // 요구 메시지가 nil 인 경우, isNil 에러 처리.
        guard let inputLine = readLine() else{ throw OutputView.CoordsError.isNil }
        return inputLine
    }
    
    // 에러 메시지 출력.
    static func printErrorMessage(of type: OutputView.CoordsError) -> [Int] {
        let errorMessage = type.rawValue
        // 에러 메시지를 좌표평면 중간에 출력하기 위한 위치 계산. - 메시지에 숫자나 특수문자가 들어가면 오차 생길 수 있음.
        let posYOfErrorMsg = startOfAxisY + ANSICode.axis.AxisLimit/2
        let posXOfErrorMsg = ( startOfAxisX + (ANSICode.axis.AxisLimit-errorMessage.count)/2 ) * ratioOfAxisX
        // 에러 메시지를 빨간 색상으로 출력.
        print("\(ANSICode.cursor.move(row: posYOfErrorMsg, col: posXOfErrorMsg))\(ANSICode.text.redBright)\(errorMessage)")
        // 메시지 지울 때 사용하기 위해 메시지 시작좌표 반환.
        return [posYOfErrorMsg, posXOfErrorMsg]
    }
    
    // 특정 위치부터 가로 끝까지 지움. (에러 메시지 출력 위함.)
    static func erase(at position: [Int]?){
        guard let position = position else{ return }
        print("\(ANSICode.cursor.move(row: position[0], col: position[1]))\(ANSICode.eraseEndLine)")
    }
    
    // 도형에 따라 출력.
    static func printNumerousHearts(inShape userFigure: FigureCalculatable?){
        guard let userFigure = userFigure else { return }
        // userFigure의 타입에 따라 하트 출력.
        printHeart(from: userFigure)
        reset()
        printDescription(of: userFigure)
    }
    
    static func printDescription(of userInput: FigureCalculatable){
        var description: String = ""
        switch userInput {
        case let userLine as MyLine:
            description = "두 점 사이 거리는 " + String(format: "%.6f", userLine.calculate())
        case let userTriangle as MyTriangle:
            description = "삼각형 넓이는 " + String(format: "%.6f", userTriangle.calculate())
        default: break
        }
        print("\(ANSICode.text.green)\(ANSICode.cursor.move(row: endYOfPage, col: startXOfCommands))\(description)\(ANSICode.none)")
    }
    
    private static func reset(){
        // 프로그램 종료 후 커서를 맨 아래에 위치. 색상 등 설정 초기화. (프로그램 종료 후 명령문 위치 지정 위함.)
        print("\(ANSICode.cursor.move(row: endYOfPage, col: startXOfCommands))\(ANSICode.eraseEndLine)\(ANSICode.none)")
    }
    
    // 좌표계에 특수문자 출력.
    private static func printHeart(from userInput: FigureCalculatable){
        let userPoints = userInput.getPoints()
        for userPoint in userPoints{
            // 사용자 입력 좌표의 출력 위치 계산.
            let coordX = startOfAxisX + userPoint.x*ratioOfAxisX
            let coordY = startOfAxisY + ANSICode.axis.AxisLimit - userPoint.y
            // 빨간색 하트 출력.
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: coordY, col: coordX))♥︎")
            // 보조선 출력.
            printAssistLine(toX: coordX, andY: coordY)
        }
    }
    
    // 보조선 출력.
    private static func printAssistLine(toX pointX: Int, andY pointY: Int){
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
}

