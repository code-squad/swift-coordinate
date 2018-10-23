//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    // 첫 입력값을 받는 부분
    var input = InputView(mention: "좌표를 입력하세요.").readInput()
    var error = ErrorCheck(input: input).checkInputError()
    
    // 올바르지 않은 입력을 받았을 때, 에러를 처리하고 재입력을 받는 부분
    while error != .noError {
        input = InputView(mention: "\(error.rawValue)\n좌표를 입력하세요.").readInput()
        error = ErrorCheck(input: input).checkInputError()
    }
    
    // 확인과 변환을 거친 입력을, 출력되는 좌표 체계에 맞게 변환하고 전달하는 부분
    let convertedPoints = ConvertInput(correctInput: input).delievePoints()
    
    // 입력받은 두 개의 좌표값 정보를 처리해주기 위해 MyLine 구조체에 전달
    let myLine = MyLine(points: convertedPoints)
    
    // 좌표를 그리고, 원하는 포인트를 찍어주는 부분
    let outputView = OutputView(points: myLine.delievePoints())
    outputView.drawAxis()   // 출력을 책임지는 구조체의 좌표를 그리는 메소드
    outputView.markPoint()  // 출력을 책임지는 구조체의 원하는 포인트를 찍는 메소드
    
    // 거리를 계산하고 출력해주는 부분
    print(myLine.calculateDistance())
}

main()
