//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() -> Bool {
    let inputPoint = InputView(mention: "좌표를 입력하세요.").readInput()
    
//    let outputView = OutputView(point: myPoint)
//    outputView.drawAxis()   // 출력을 책임지는 구조체의 좌표를 그리는 메소드
//    outputView.markPoint()  // 출력을 책임지는 구조체의 원하는 포인트를 찍는 메소드
    
    return true
}

while(true) {
    if !main() {break}
}
