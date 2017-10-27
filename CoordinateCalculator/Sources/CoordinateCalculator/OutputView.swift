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
    
    // 좌표축 출력.
    static func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.axis.draw())")
    }
    
    // 사용자 입력 메뉴 출력 및 입력 메시지 반환.
    static func askFor(message: String) throws -> String?{
        // 요구 메시지 출력.
        print("\(ANSICode.cursor.move(row: endYOfPage, col: startXOfCommands))\(ANSICode.eraseEndLine)\(ANSICode.none)\(message)", terminator: " ")
        // 요구 메시지가 nil 인 경우, isNil 에러 처리.
        guard let inputLine = readLine() else{ throw MyPoint.PointError.isNil }
        return inputLine
    }
    
    // 에러 메시지 출력.
    static func printErrorMessage(of type: MyPoint.PointError){
        let errorMessage = type.rawValue
        // 에러 메시지를 좌표평면 중간에 출력하기 위한 위치 계산.
        let posYOfErrorMsg = startOfAxisY + ANSICode.axis.AxisLimit/2
        let posXOfErrorMsg = ( startOfAxisX + (ANSICode.axis.AxisLimit-errorMessage.count)/2 ) * ratioOfAxisX
        print("\(ANSICode.cursor.move(row: posYOfErrorMsg, col: posXOfErrorMsg))\(errorMessage)")
    }
    
    // 사용자 입력 위치에 특수문자 출력.
    static func printHeart(at userPoint: MyPoint){
        let coordX = startOfAxisX + userPoint.x*ratioOfAxisX
        let coordY = startOfAxisY + ANSICode.axis.AxisLimit - userPoint.y
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: coordY, col: coordX))♥︎")
        printAssistLine(toX: coordX, andY: coordY)
        // 프로그램 종료 후 커서를 맨 아래에 위치. 설정 초기화.
        print("\(ANSICode.cursor.move(row: endYOfPage, col: startXOfCommands))\(ANSICode.none)")
    }
    
    // 보조선 출력.
    private static func printAssistLine(toX pointX: Int, andY pointY: Int){
        for x in startOfAxisX+1..<pointX{
            print("\(ANSICode.cursor.move(row: pointY, col: x))-")
        }
        for y in pointY+1..<ANSICode.axis.AxisLimit+1{
            print("\(ANSICode.cursor.move(row: y, col: pointX))|")
        }
    }
}

