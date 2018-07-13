//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

//print("Hello, World!")

// * Step 1
OutputView.initAxis()

// * Step 2
while (true) {
    do {
        let inputValue = InputView().readInput() 
        if inputValue == "q" {
            break
        }
        let checkedValue = try SyntaxChecker().makeCheckedValues(inputValue)
        OutputView.drawPoint(checkedValue)
    } catch let error as SyntaxChecker.ErrorMessage {
        print(error.rawValue)
    } catch {
        print (SyntaxChecker.ErrorMessage.ofUnKnownError.rawValue)
    }
}



// 예) 좌표를 입력하세요
//     (10, 10)
// --> 좌표축에 (10, 10)이 찍힙니다. 계산할 필요는 없고 불러 쓰면 됨. 
//InputView.readInput()
//InputView.readInput(InputView)

//let defaultMessage = "좌표를 입력하세요 ex)(10,10)"

//let a = readLine()
//if let b = a {
//    print(b)
//}

//    let defaultMessage = "좌표를 입력하세요.예) (10,10)"
//    print(defaultMessage)
//    var MyPoint.input = InputView.readInput("")
//    OutputView.drawPoint(MyPoint.input)print("\(ANSICode.cursor.move(row:1, col: 1))")

