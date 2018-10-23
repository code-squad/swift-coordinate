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
    let first = InputView(mention: "좌표를 입력하세요.").readInput()
    var error = ErrorCheck(input: first).checkInputError()
    
    // 올바르지 않은 입력을 받았을 때, 에러를 처리하고 재입력을 받는 부분
    while error != .noError {
        let next = InputView(mention: "\(error.rawValue)\n올바른 좌표를 입력하세요.").readInput()
        error = ErrorCheck(input: next).checkInputError()
    }
    
    let convertedPoint = ConvertInput(initialInput: first).convertToPoint()
    // 확인과 변환을 거친 입력을, 출력되는 좌표 체계에 맞게 변환하고 전달하는 부분
    let xandy = MyPoint(point: convertedPoint).delievePoints()
    
    // 좌표를 그리고, 원하는 포인트를 찍어주는 부분
    let outputView = OutputView(point: xandy)
    outputView.drawAxis()   // 출력을 책임지는 구조체의 좌표를 그리는 메소드
    outputView.markPoint()  // 출력을 책임지는 구조체의 원하는 포인트를 찍는 메소드
}

main()
