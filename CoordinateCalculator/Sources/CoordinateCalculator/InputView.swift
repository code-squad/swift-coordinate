//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 26..
//

import Foundation

struct InputView {
    
    private(set) var userInput: String
    
    init?() throws {
        self.userInput = try InputView.askFor(message: "좌표를 입력하세요: ")
        // q 또는 quit 입력 시 종료.
        guard self.userInput != "q" && self.userInput != "quit" else { return nil }
    }
    
    // 사용자 입력 메뉴 출력. 사용자 입력값을 '(Int,Int)-' 패턴으로 잘라서 반환.
    private static func askFor(message: String) throws -> String {
        // 요구 메시지 출력.
        print("\(ANSICode.cursor.move(row: OutputView.endYOfPage, col: OutputView.startXOfCommands))\(ANSICode.eraseEndLine)\(ANSICode.none)\(message)", terminator: " ")
        // 요구 메시지가 nil 인 경우, isNil 에러 처리.
        guard let inputLine = readLine() else{ throw FigureFactory.CoordsError.isNil }
        return inputLine
    }
    
}
