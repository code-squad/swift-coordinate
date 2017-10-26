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
    // 사용자 입력 메뉴.
    guard let userInput = InputView.input(message: "좌표를 입력하세요: ") else{ return }
    // 사용자 입력 문자열에서 x,y 값을 분리하여 MyPoint 객체로 변환.
    let userPoint = InputView.readInput(coordsWithBracelet: userInput)
    // X,Y 좌표 모두 최대 24까지만 입력 가능. 입력범위 초과 시, 에러 메시지 출력. 재입력 받음.
    guard InputView.isUnderAxisLimit(userPoint) else { print(OutputView.axisErrorMessage); return }
    // 정상적인 좌표값인 경우, 해당 좌표에 특수문자 표시.
    OutputView.printHeart(at: userPoint)
}

while true {
    main()
}
