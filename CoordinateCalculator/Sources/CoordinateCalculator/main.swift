//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() throws {
    // 좌표축 그림.
    OutputView.drawAxis()
    var userData = UserData()
    var userFigure: FigureCalculatable?
    
    // 사용자 입력. 에러나면 반복.
    while let userInput = try InputView.askFor(message: "좌표를 입력하세요: ") {
        do{
            // 좌표계 중앙에 출력된 에러메시지 지움.
            OutputView.eraseErrorMessage()
            userData = try InputView.makeUserData(from: userInput)
            userFigure = try FigureFactory.produceFigure(from: userData)
        }catch let e as FigureFactory.CoordsError{
            // 도형 생산 시 발생하는 에러 출력. 에러 출력 위치 저장.
            OutputView.printErrorMessage(of: e)
            continue    // while 문 다시 시작.
        }
        break           // 정상입력 시 while 문 종료.
    }
    // 에러가 난 경우, 에러를 지우고 결과 출력.
    OutputView(userFigure)
}

try main()


