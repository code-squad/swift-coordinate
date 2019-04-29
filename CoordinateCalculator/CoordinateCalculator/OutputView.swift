//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 27/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
}


struct InputView {
    let question = "좌표를 입력하세요."
    
    private static func question() throws -> String {
    print(question)
        guard let answer = readLine() else {
            throw InputError.emptyValue
        }
        return answer
    }
}


public struct OutputView {
    static func drawAxis(){
        // 출력 화면을 지우는 ANSI코드
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
        print("\(ANSICode.cursor.move(row:10, col: 10))*")
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
}


enum InputError: Error {
    case emptyValue
    var description: String {
        switch self {
        case .emptyValue: return "값이 없습니다."
            
        }
    }
}
