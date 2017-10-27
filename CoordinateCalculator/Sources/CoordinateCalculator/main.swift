//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() throws{
    // 좌표축 그림.
    OutputView.drawAxis()
    // 사용자 입력 좌표 저장 변수.
    var userPoint: MyPoint = MyPoint()
    // 좌표축 범위를 넘는 경우, 계속 입력받음.
    while let userInput = try OutputView.askFor(message: "좌표를 입력하세요: ") {
        do{// 사용자 입력을 MyPoint 객체로 변환.
            userPoint = try InputView.readInput(rawCoords: userInput)
        }catch MyPoint.PointError.outOfBounds{
            // 좌표축 범위를 넘으면 관련 에러 메시지 출력.
            OutputView.printErrorMessage(of: MyPoint.PointError.outOfBounds)
            // while 문 다시 시작.
            continue
        }
        // 정상입력 시 while 문 종료.
        break
    }
    // 정상적인 좌표값인 경우, 해당 좌표에 특수문자 표시.
    OutputView.printHeart(at: userPoint)
}

try main()


