//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    // 좌표축 그림.
    OutputView.drawAxis()
    // 사용자 입력 좌표 저장 변수.
    var userPoint: MyPoint = MyPoint()
    // while문 실행 횟수.
    var execCount: Int = 1
    var userInput: String = ""
    repeat{
        // 사용자 입력 메뉴.
        userInput = InputView.input(message: "좌표를 입력하세요: ")!
        // 사용자 입력 문자열에서 x,y 값을 분리하여 MyPoint 객체로 변환.
        userPoint = InputView.readInput(rawCoords: userInput)
        // 첫 실행이 아니면 에러 메시지는 스킵.
        if execCount != 1 { print(OutputView.axisErrorMessage) }
        // 실행 횟수 +1
        execCount += 1
    }while(InputView.isOverAxisLimit(userPoint) || (userInput == "q" || userInput == "quit"))
    
    // 정상적인 좌표값인 경우, 해당 좌표에 특수문자 표시.
    OutputView.printHeart(at: userPoint)
}

main()

