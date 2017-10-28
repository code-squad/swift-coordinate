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
    var userPoints: [MyPoint] = []
    // 에러 메시지 출력 위치 저장 변수.
    var posOfErrorMsg: [Int]?
    // 좌표축 범위를 넘는 경우, 계속 입력받음.
    while let userInput = try OutputView.askFor(message: "좌표를 입력하세요: ") {
        do{// 사용자 입력을 MyPoint 객체로 변환.
            userPoints = try InputView.readInput(rawCoords: userInput)
        }catch InputView.CoordsError.invalidInputPattern{
            posOfErrorMsg = OutputView.printErrorMessage(of: InputView.CoordsError.invalidInputPattern)
            continue    // while 문 다시 시작.
        }catch InputView.CoordsError.outOfBounds{
            // 좌표축 범위를 넘으면 관련 에러 메시지 출력.
            posOfErrorMsg = OutputView.printErrorMessage(of: InputView.CoordsError.outOfBounds)
            continue    // while 문 다시 시작.
        }
        break           // 정상입력 시 while 문 종료.
    }
    
    // 좌표계 중앙에 출력된 에러메시지 지움.
    OutputView.erase(at: posOfErrorMsg)
    // 정상적인 좌표값인 경우, 해당 좌표에 특수문자 표시.
    OutputView.printHeart(at: userPoints)
}

try main()


