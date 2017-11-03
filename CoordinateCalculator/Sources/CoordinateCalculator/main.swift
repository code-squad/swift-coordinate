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
    var userFigure: FigureCalculatable?
    // 에러 메시지 출력 위치 저장 변수.
    var posOfErrorMsg: [Int]?
    
    
    // 좌표축 범위를 넘는 경우, 계속 입력받음.
    while let userInput = try OutputView.askFor(message: "좌표를 입력하세요: ") {
        do{// 사용자 입력을 MyPoint 객체로 변환.
            userFigure = try InputView.readInput(rawCoords: userInput)
        }catch OutputView.CoordsError.invalidInputPattern{
            // 좌표 패턴에 맞지 않게 입력 시 에러 메시지 출력.
            posOfErrorMsg = OutputView.printErrorMessage(of: OutputView.CoordsError.invalidInputPattern)
            continue    // while 문 다시 시작.
        }catch OutputView.CoordsError.outOfBounds{
            // 좌표축 범위를 넘으면 관련 에러 메시지 출력.
            posOfErrorMsg = OutputView.printErrorMessage(of: OutputView.CoordsError.outOfBounds)
            continue    // while 문 다시 시작.
        }catch OutputView.CoordsError.invalidRectPoints{
            // 직사각형에 맞지 않는 좌표 입력 시 에러 메시지 출력.
            posOfErrorMsg = OutputView.printErrorMessage(of: OutputView.CoordsError.invalidRectPoints)
            continue
        }catch OutputView.CoordsError.zeroException{
            posOfErrorMsg = OutputView.printErrorMessage(of: OutputView.CoordsError.zeroException)
            continue
        }
        break           // 정상입력 시 while 문 종료.
    }
    
    // 좌표계 중앙에 출력된 에러메시지 지움.
    OutputView.erase(at: posOfErrorMsg)
    // 정상적인 좌표값인 경우, 해당 좌표에 특수문자 표시.
    OutputView.printNumerousHearts(inShape: userFigure)
}

try main()


