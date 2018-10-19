//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let inputValue = InputView(mention: "좌표를 입력하세요.").readInput()
    var convertedPoint = ConvertInput(initialValue: inputValue).convertToPoint()
    
    // 
    while !Validity(point: convertedPoint).isRight() {
        let nextValue = InputView(mention: "올바른 좌표를 입력하세요.").readInput()
        let nextPoint = ConvertInput(initialValue: nextValue).convertToPoint()
        convertedPoint = nextPoint
        if Validity(point: nextPoint).isRight() {
            break
        }
    }
    
    let myPoint = MyPoint(point: convertedPoint).delievePoint()
    
    let outputView = OutputView(point: myPoint)
    outputView.drawAxis()   // 출력을 책임지는 구조체의 좌표를 그리는 메소드
    outputView.markPoint()  // 출력을 책임지는 구조체의 원하는 포인트를 찍는 메소드
}

main()
