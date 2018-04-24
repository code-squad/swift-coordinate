//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    // 인풋뷰 구조체 선언
    let inputView = InputView()
    // 유저인풋을 받음
    guard let axisList = inputView.receiveUserAxis() else {
        return 
    }
    // 프린트용 구조체 선언
    let outputView = OutputView()
    // 좌표축 프린트
    outputView.drawAxis()
    // 좌표에 특수문자 출력
    outputView.draw(myPointList: axisList)
}

main()
